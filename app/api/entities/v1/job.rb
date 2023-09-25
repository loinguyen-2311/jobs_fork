module API::Entities::V1
  class Job < API::Entities::V1::Base
    expose :id, documentation: { type: 'Integer', desc: 'Id of Job.' }
    expose :title, documentation: { type: 'String', desc: 'Title of Job.' }
    expose :province, documentation: { type: 'String', desc: 'Province of Job.' }
    expose :state, documentation: { type: 'String', desc: 'State of Job.' }
    expose :salary_text, documentation: { type: 'String', desc: 'Salary of Job.' }
  end
end
