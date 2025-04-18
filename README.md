# Group Scholar Intake Auditor

Group Scholar Intake Auditor is a Ruby CLI that audits applicant intake CSV files for data quality issues, completeness, and operational signals. It outputs a concise console summary and can write a full JSON report for downstream workflows.

## Features
- Validates required headers and missing field coverage.
- Flags invalid emails, out-of-range scores, and bad timestamps.
- Summarizes status and stage distributions.
- Summarizes program distribution and missing program counts.
- Adds per-program required-field completeness gaps.
- Computes score statistics and submission windows.
- Adds score and submission-age percentiles for richer distribution insight.
- Highlights duplicate emails and recent submission counts.
- Highlights duplicate applicant IDs.
- Summarizes top email domains and submission recency buckets.
- Reports field completeness and blank status/stage counts.
- Calculates complete-required-row coverage and submission day/hour trends.
- Flags unknown status/stage values when allowlists are supplied.
- Outputs JSON for deeper analysis or automation.

## Usage

```bash
bin/gs-intake-auditor path/to/intake.csv
```

Write a full JSON report:

```bash
bin/gs-intake-auditor path/to/intake.csv --json report.json
```

Control the number of sample issue rows:

```bash
bin/gs-intake-auditor path/to/intake.csv --sample 5
```

Tune the recency and stale submission windows:

```bash
bin/gs-intake-auditor path/to/intake.csv --recent-days 14 --stale-days 365
```

Validate status/stage values against an allowlist:

```bash
bin/gs-intake-auditor path/to/intake.csv --status-allowlist "Submitted,In Review,Final" --stage-allowlist "Round 1,Round 2,Awarded"
```

## Expected headers

```
applicant_id, name, email, program, submitted_at, status, stage, score
```

## Tech
- Ruby 2.6+ (standard library only)
