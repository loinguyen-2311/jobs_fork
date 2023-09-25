module API::Entities::V1
  class CvDetail < API::Entities::V1::Base
    expose :id, documentation: { type: 'Integer', desc: 'Id of Document.' }
    expose :candidate_name, documentation: { type: 'String', desc: 'Candidate Name' }
  end
end
