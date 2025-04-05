# Group Scholar Intake Auditor

Group Scholar Intake Auditor is a Ruby CLI that audits applicant intake CSV files for data quality issues, completeness, and operational signals. It outputs a concise console summary and can write a full JSON report for downstream workflows.

## Features
- Validates required headers and missing field coverage.
- Flags invalid emails, out-of-range scores, and bad timestamps.
- Summarizes status and stage distributions.
- Computes score statistics and submission windows.
- Highlights duplicate emails and recent submission counts.
- Highlights duplicate applicant IDs.
- Reports field completeness and blank status/stage counts.
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

## Expected headers

```
applicant_id, name, email, program, submitted_at, status, stage, score
```

## Tech
- Ruby 2.6+ (standard library only)
