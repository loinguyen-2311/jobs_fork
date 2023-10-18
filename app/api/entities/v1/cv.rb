module API::Entities::V1
  class Cv < API::Entities::V1::Base
    expose :id, documentation: { type: 'Integer', desc: 'Id of Document.' }
    expose :job_id, documentation: { type: 'Integer', desc: 'EmpployeeID of Document.' }
    expose :cv_url, documentation: { type: 'Integer', desc: 'JobID of Document.' }
    # giống như serialize, bắt buộc các fields này phải có trong phần trả về
  end
end
