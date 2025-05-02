#!/usr/bin/env ruby

require "pg"

DB_URL = ENV["GS_INTAKE_AUDITOR_DATABASE_URL"] || ENV["DATABASE_URL"]

if DB_URL.nil? || DB_URL.strip.empty?
  warn "Missing GS_INTAKE_AUDITOR_DATABASE_URL/DATABASE_URL"
  exit 1
end

schema_sql = File.read(File.join(__dir__, "schema.sql"))
migrate_path = File.join(__dir__, "migrate.sql")
migrate_sql = File.exist?(migrate_path) ? File.read(migrate_path) : nil
seed_sql = File.read(File.join(__dir__, "seed.sql"))

conn = PG.connect(DB_URL)

begin
  conn.exec(schema_sql)
  conn.exec(migrate_sql) if migrate_sql
  conn.exec(seed_sql)
  puts "Bootstrap complete."
ensure
  conn.close
end
