# Get jobs having from 2 cvs
jobs = Job.find_by_sql(
  <<~SQL
    SELECT * FROM jobs WHERE id IN (
      SELECT jobs.id
      FROM jobs
      INNER JOIN cvs
      ON cvs.job_id = jobs.id
      GROUP BY jobs.id
      HAVING COUNT(*) > 1
    )
  SQL
)

# Get all job having cvs (just need to have cvs)
Job.find_by_sql(
  <<~SQL
    SELECT * FROM jobs WHERE id IN (
      SELECT jobs.id
      FROM jobs
      INNER JOIN cvs
      ON cvs.job_id = jobs.id
      GROUP BY jobs.id
      HAVING COUNT(*) > 0
    )
  SQL
)

Job.find_by_sql(
  <<~SQL
    SELECT * FROM jobs WHERE id IN (
      SELECT jobs.id
      FROM jobs
      INNER JOIN cvs
      ON cvs.job_id = jobs.id
      GROUP BY jobs.id
      HAVING COUNT(*) > 0
    )
  SQL
)

Job.find_by_sql(
  <<~SQL
    SELECT distinct(jobs.*)
    FROM jobs
    INNER JOIN cvs
    ON cvs.job_id = jobs.id
  SQL
)

Job.select('DISTINCT jobs.*').joins(:cvs)
Job.joins(:cvs).distinct
Job.joins(:cvs).uniq

# Write a sql to sort jobs has_many cvs on the top (no cv in the last)
Job.find_by_sql(
  <<~SQL
    SELECT jobs.*,
        count(cvs.id) AS cv_number
    FROM jobs
    LEFT JOIN cvs ON jobs.id = cvs.job_id
    GROUP BY jobs.id
    ORDER BY cv_number DESC
  SQL
)
