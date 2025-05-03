# Group Scholar Intake Auditor Progress

## Iteration 1
- Built a Ruby CLI to audit intake CSV files for data quality and operational summaries.
- Added JSON report output, issue sampling, and documentation.

## Iteration 2
- Added field completeness coverage reporting plus blank status/stage counts.
- Surfaced lowest-coverage fields in the console summary and extended JSON output.

## Iteration 3
- Added configurable recency/stale windows for submission timing checks.
- Included duplicate applicant ID detection in console and JSON output.

## Iteration 4
- Added program distribution tracking with blank program counts in console and JSON output.

## Iteration 5
- Added per-program required-field completeness gaps to highlight weak intake coverage by program.

## Iteration 5
- Added complete-required-row coverage plus submission weekday/hour trend summaries.
- Added status/stage allowlists to flag unknown values in console and JSON output.

## Iteration 6
- Added email domain distribution summaries to surface top intake email domains.
- Added submission recency buckets for fast age profiling in console and JSON output.

## Iteration 6
- Added status-stage and program-status distribution tracking in console and JSON output.

## Iteration 7
- Added optional Postgres logging for audit summaries via `--db-log` and documented usage.
- Provisioned production schema/table with seed audit run records.

## Iteration 7
- Added score percentiles plus submission age statistics (min/avg/max and p50/p90/p95) to console and JSON output.

## Iteration 8
- Added production Postgres schema and seed data for audit run logging.
- Documented database setup for production use.

## Iteration 8
- Added daily/weekly submission trend windows plus stale submissions by program.
- Extended JSON output, console summary, and DB logging/schema with trend and stale-program fields.
- Seeded the production intake_auditor audit_runs table with a realistic sample record.

## Iteration 9
- Added per-program and per-status score stats plus missing-score counts to the audit report and DB log.
- Added recent submissions by program and per-program recency buckets in JSON and console output.
- Added a `--now` override for reproducible audits and created a minitest coverage suite with fixtures.

## Iteration 10
- Added issue type frequency counts plus multi-issue row metrics to the audit report.
- Surfaced top issue types and multi-flag rows in the console summary and JSON output.
- Extended the test suite to validate new issue aggregation metrics.

## Iteration 11
- Added submission gap statistics to highlight intake inactivity stretches in JSON and console output.
- Extended Postgres logging/schema with submission gap metrics and added a migration helper.
- Updated tests and seed data to cover the new submission gap reporting.

## Iteration 12
- Added monthly submission trend reporting with configurable window in JSON and console output.
- Extended Postgres schema/logging plus seed data for monthly trend capture.
- Updated tests and documentation for the new trend option.
