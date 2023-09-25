module API::Entities::V1
  class JobDetail < API::Entities::V1::Base
    expose :id, documentation: { type: 'Integer', desc: 'Id of Job.' }
    expose :user_id, documentation: { type: 'Integer', desc: 'UserID of Job.' }
    expose :benifit, documentation: { type: 'Text', desc: 'Benifit of Job.' }
    expose :requirement, documentation: { type: 'Text', desc: 'Requirement of Job.' }
    expose :description, documentation: { type: 'Text', desc: 'Description of Job.' }
    expose :title, documentation: { type: 'String', desc: 'Title of Job.' }
    expose :category, documentation: { type: 'String', desc: 'Category of Job.' }
    expose :province, documentation: { type: 'String', desc: 'Province of Job.' }
    expose :state, documentation: { type: 'String', desc: 'State of Job.' }
    expose :job_type, documentation: { type: 'String', desc: 'Job Type of Job.' }
    expose :salary_type, documentation: { type: 'String', desc: 'Salary Type' }
    expose :job_system, documentation: { type: 'String', desc: 'Job System of Job.' }
    expose :company_name, documentation: { type: 'String', desc: 'Company Name of Job.' }
    expose :salary, documentation: { type: 'String', desc: 'Salary of Job.' }
    expose :salary_text, documentation: { type: 'String', desc: 'Salary of Job.' }
    expose :job_description_link, documentation: { type: 'String', desc: 'Salary of Job.' }
    expose :min_salary, documentation: { type: 'Integer', desc: 'Min Salary of Job.' }
    expose :max_salary, documentation: { type: 'Integer', desc: 'Max Salary of Job.' }
    expose :views, documentation: { type: 'Integer', desc: 'View of Job.' }
    expose :status, documentation: { type: 'Integer', desc: 'Status of Job.' }
    expose :bonus, documentation: { type: 'Integer', desc: 'Money Bonus of Job.' }
    expose :bonus_for_dev, documentation: { type: 'Integer', desc: 'Money Bonus of Job.' }
    expose :by_partner, documentation: { type: 'String', desc: 'Job by partner' }
    expose :display_pulse, documentation: { type: 'Boolean', desc: 'Display Boolean.' }
    expose :commission, documentation: { type: 'String', desc: 'Job Commission' }
    expose :sync_from_partner, documentation: { type: 'String', desc: 'Sync From Partner' }
  end
end
