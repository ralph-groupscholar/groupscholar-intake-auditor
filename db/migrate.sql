ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS score_stats_by_program jsonb NOT NULL DEFAULT '{}'::jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS score_stats_by_status jsonb NOT NULL DEFAULT '{}'::jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS recent_submissions_by_program jsonb NOT NULL DEFAULT '{}'::jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS submission_recency_by_program jsonb NOT NULL DEFAULT '{}'::jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS submission_gap_stats jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS submission_age_by_status jsonb NOT NULL DEFAULT '{}'::jsonb;

ALTER TABLE intake_auditor.audit_runs
  ADD COLUMN IF NOT EXISTS submission_monthly_trend jsonb NOT NULL DEFAULT '{}'::jsonb;
