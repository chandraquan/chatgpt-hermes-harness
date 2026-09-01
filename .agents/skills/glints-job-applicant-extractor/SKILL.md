---
name: glints-job-applicant-extractor
description: Extract Glints job applicants from authenticated browser network channel fetches across all pagination pages and export them in the supplied Power Query column format.
metadata:
  short-description: Export Glints applicants from network channel data
---

# Glints Job Applicant Extractor

Use this skill when the user asks to collect Glints applicants/chats from the employer messages page, load all paginated results, or create an applicant Excel export.

## Source of truth

- Use the authenticated in-app browser and inspect the Network `channel` fetch. The response body of that fetch is the only source of applicant data.
- Do not use DOM text as the data source, local folders such as `C:\Users\...\Glints\Source`, manually exported files, guessed API responses, or other endpoints as substitutes.
- Before each pagination action, capture the CDP event cursor. Scroll the applicant list to the bottom and click `Muat lainnya` while it exists. Capture the matching response body and deduplicate by the numeric `page` parameter, because a UI click can produce a repeated request.
- Continue until the button is absent or the response has `hasMore: false`. Verify sequential pages, per-page channel counts, and the total channel count before exporting.

## Truthfulness and privacy

- Copy values exactly from the response JSON. Never infer, reconstruct, unmask, or supplement phone numbers from the UI, profile pages, CVs, filenames, or external sources.
- If `members[].contact.number` is `+62****` or another masked value, preserve that exact value and record in the workbook summary that the server payload was masked.
- Do not inspect or expose cookies, tokens, localStorage, passwords, or authorization headers. Stop and ask the user if the authenticated session or network response is unavailable.

## Row mapping

Create one output row per network channel by selecting the member with `loginRole = CANDIDATE`. Map the fields in this exact order:

`Source.Name, job.id, job.title, Name, key, label, name.1, firstName, lastName, loginRole, type, number, id.4, title, salaryExpectation, currencyCode, careerStartDate, highestEducationLevel, gender, birthDate, workExperiences, id, name, formattedName, countryCode, level, parents, distanceText.1`

Apply only the format-preserving mappings needed for those columns:

- `Source.Name` is `network_page_<page>`; it is provenance, not a folder filename.
- `Name` is `data`.
- `key` is `https://assets.glints.com/resume/` plus `exchangeRequests.cv.file.key` when present.
- `workExperiences` and `parents` are serialized as JSON text so the nested data remains in one cell.
- Preserve null/empty values rather than inventing replacements.
- Keep one row per channel by default. Do not apply the supplied M query's `Table.Distinct(..., {"number"})` when it would collapse multiple channels that share a masked number; apply that deduplication only if the user explicitly requests exact M semantics.
- Sort by network page, then job title, unless the user specifies another ordering.

## Excel output

When an `.xlsx` is requested, use the available `spreadsheets:Spreadsheets` skill and artifact-tool workflow. Create a workbook with:

1. `Summary`: endpoint, job, pages loaded, per-page counts, `hasMore` status, total network channels, output rows, and any masking note.
2. `Power Query Format`: the 28 columns above, with a frozen header row and readable table formatting.

Save the final workbook under the task's `outputs/<thread-id>/` directory. Verify that the page-count sum equals the output row count, inspect representative rows including `number`, scan for formula errors, and render the key ranges before reporting completion.

## CV phone enrichment

If the workbook contains a rightmost `Get phone Number` flag and the user asks for phone enrichment:

- Read the existing workbook first and preserve its style. Process only rows whose flag is `true`; leave `false` rows unchanged.
- Open or download the CV URL in the row's `key` column. Use the authenticated browser/session when direct asset access is denied. Extract only phone-like text from the CV; do not use the masked network `number` as a substitute.
- Normalize Indonesian mobile numbers to `628...`: remove spaces, punctuation, and a leading `+` or national `0`, then prepend `62` as needed. Write the result to a new rightmost `whatsapp` column as a visible text-like value, not scientific notation.
- If the CV has no readable phone number, is image-only without OCR support, or returns an access error such as 403, leave `whatsapp` blank and report the count. Never guess or reconstruct a missing number.
- Preserve the flag column and extend the existing table/filter/style to include `whatsapp`. Verify that no `false` row receives a value, every nonblank value starts with `628`, and the processed/extracted/missing/error counts reconcile.

## Failure behavior

Do not claim completion if a page response body was not captured, pagination repeated without a new page, the final `hasMore` state is unknown, or the workbook row count cannot be reconciled with the captured pages. Report the exact stopping condition and preserve the last verified data instead.
