module Jobs
  class DevGroupJobQuery < Patterns::Query
    queries Job

    private

    def query
      relation.where(
        sent_job: false,
        status: Job.statuses[:going],
        sync_from_partner: Job.sync_from_partners[:dtalent]
      ).limit(10)
    end
  end
end

# Ref: https://github.com/nguyenvanhuan243/pattern
