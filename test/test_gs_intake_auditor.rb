# frozen_string_literal: true

require "json"
require "minitest/autorun"
require "open3"
require "tmpdir"

class IntakeAuditorTest < Minitest::Test
  def test_program_score_and_recency_stats
    fixture = File.expand_path("fixtures/sample.csv", __dir__)
    Dir.mktmpdir do |dir|
      json_path = File.join(dir, "report.json")
      cmd = [
        File.expand_path("../bin/gs-intake-auditor", __dir__),
        fixture,
        "--json", json_path,
        "--now", "2026-02-08T12:00:00Z",
        "--recent-days", "30",
        "--stale-days", "180",
        "--trend-days", "7",
        "--trend-weeks", "2",
        "--trend-months", "6"
      ]

      _stdout, stderr, status = Open3.capture3(*cmd)
      assert status.success?, "expected success, got: #{stderr}"

      report = JSON.parse(File.read(json_path))

      stem_scores = report.fetch("score_stats_by_program").fetch("STEM").fetch("score_stats")
      assert_equal 85.0, stem_scores.fetch("avg")

      arts_stats = report.fetch("score_stats_by_program").fetch("Arts")
      assert_equal 70.0, arts_stats.fetch("score_stats").fetch("avg")
      assert_equal 1, arts_stats.fetch("missing_scores")

      recent_by_program = report.fetch("recent_submissions_by_program")
      assert_equal 1, recent_by_program.fetch("STEM")
      assert_equal 1, recent_by_program.fetch("Arts")
      assert_equal 1, recent_by_program.fetch("Business")

      stem_recency = report.fetch("submission_recency_by_program").fetch("STEM")
      assert_equal 1, stem_recency.fetch("age_30d")
      assert_equal 1, stem_recency.fetch("age_180d")

      issue_types = report.fetch("issue_type_counts")
      assert_equal 1, issue_types.fetch("missing_score")
      assert_equal 1, issue_types.fetch("submitted_at_stale")
      assert_equal 1, report.fetch("issue_rows_with_multiple_issues")

      gap_stats = report.fetch("submission_gap_stats")
      assert_equal 4.04, gap_stats.fetch("min_days")
      assert_equal 62.24, gap_stats.fetch("avg_days")
      assert_equal 152.88, gap_stats.fetch("max_days")
      assert_equal 3.04, gap_stats.fetch("last_gap_days")

      status_age = report.fetch("submission_age_by_status")
      submitted_age = status_age.fetch("Submitted")
      assert_equal 4, submitted_age.fetch("count")
      assert_equal 71.57, submitted_age.fetch("avg_days")
      assert_equal 1, submitted_age.fetch("stale_count")
      assert_equal 3, submitted_age.fetch("recent_count")

      in_review_age = status_age.fetch("In Review")
      assert_equal 99.13, in_review_age.fetch("avg_days")

      monthly_trend = report.fetch("submission_monthly_trend")
      assert_equal 0, monthly_trend.fetch("2025-09-01")
      assert_equal 0, monthly_trend.fetch("2025-10-01")
      assert_equal 1, monthly_trend.fetch("2025-11-01")
      assert_equal 0, monthly_trend.fetch("2025-12-01")
      assert_equal 1, monthly_trend.fetch("2026-01-01")
      assert_equal 2, monthly_trend.fetch("2026-02-01")
    end
  end
end
