module Jobs
  class CommissionJobQuery < Patterns::Query
    queries Job

    private

    def query
      commission = options[:commission]
      job_ids = []
      relation.each do |job|
        if job.commission.present?
          if job.commission.include?('%')
            commission_percent = job.commission.scan(/\d+/).first.to_i / 2
            if job.salary_text.include?('$')
              salary = job.salary_text.scan(/\d/).join('').to_i * 23_000
              salary_vnd = (salary * commission_percent) / 100
              job_ids.push(job.id) if salary_vnd >= "#{commission}000000".to_i
            else
              salary = job.salary_text.scan(/\d/).join('').to_i
              salary_vnd = (salary * commission_percent) / 100
              job_ids.push(job.id) if salary_vnd.to_i >= commission.to_i
            end
          elsif (job.commission.scan(/\d+/).first.to_i / 2).to_i >= commission.to_i
            job_ids.push(job.id)
          end
        end
      end
      relation.where(id: job_ids)
    end
  end
end
