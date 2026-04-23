# Instructor Demo Guide — Mainframe (COBOL / JCL)

Suggested flow for a foundationals Copilot training using the files in this
folder. Adjust order and depth to fit your time box.

## 1. Ask Mode — Explain unfamiliar code
Common first encounter for developers new to mainframe. Attach
[CUSTPROC.cbl](CUSTPROC.cbl) and ask:

> I've never written COBOL. Explain what this program does, section by
> section, and what each DIVISION is for.

Then attach [CUSTPROC.jcl](CUSTPROC.jcl):

> Explain this JCL and how it relates to the COBOL program.

## 2. Ask Mode — Document business logic
> Summarize the business rules enforced in `CUSTPROC.cbl` as a bulleted
> list a business analyst could review.

## 3. Edit Mode — Add a feature with minimal changes
With [CUSTPROC.cbl](CUSTPROC.cbl) open:

> Add a new counter that tracks customers whose balance is greater than
> $10,000 and include the total in the end-of-report summary. Keep
> changes minimal and follow the existing naming conventions.

## 4. Review — Find bugs or risks
> Review `CUSTPROC.cbl` for error handling gaps, such as file-status
> checks that are missing or inconsistent.

## 5. Translate / Modernize — COBOL → modern language
High-value modernization scenario:

> Translate `CUSTPROC.cbl` into a Python script that reads a CSV of
> customers and writes the same report to stdout. Preserve the existing
> business rules exactly.

Follow up:

> Now generate `pytest` tests for the translated Python using a few
> realistic sample rows, including a zero-balance edge case.

## 6. Agent Mode — End-to-end modernization
> Create a new folder `cobol/python-port/` containing a Python port of
> `CUSTPROC.cbl`, a small sample CSV input, a README describing how to
> run it, and pytest tests covering the valid/error/zero-balance paths.
