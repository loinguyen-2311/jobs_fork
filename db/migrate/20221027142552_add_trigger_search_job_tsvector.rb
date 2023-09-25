class AddTriggerSearchJobTsvector < ActiveRecord::Migration[5.0]
  def up
    say_with_time("Adding trigger function") do
      execute <<-SQL
        CREATE FUNCTION job_search_trigger() RETURNS trigger AS $$
        begin
          new.search_tsvector := (
            SELECT
              setweight(to_tsvector('pg_catalog.simple', array_to_string(array_agg(DISTINCT unaccent(lower(jobs.title))), ' ')), 'A')
            FROM jobs
            WHERE jobs.id = new.id
            GROUP BY jobs.id
          );
          return new;
        end
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER jobtsvectorupdate BEFORE INSERT OR UPDATE ON jobs FOR EACH ROW EXECUTE FUNCTION job_search_trigger();
      SQL
    end
  end

  def down
    remove_column :jobs, :search_tsvector
    execute <<-SQL
      DROP TRIGGER IF EXISTS jobtsvectorupdate on jobs;
      DROP FUNCTION IF EXISTS job_search_trigger;
    SQL
  end
end
