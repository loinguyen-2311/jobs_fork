class API::V1::Cvs < Grape::API
  helpers API::V1::Helpers

  resource :cvs do
    # desc 'Create cv for job',
    #   entity: API::Entities::V1::Cv
    # params do
    #   requires :job_id
    #   requires :file
    # end
    # post do
    #   params[:file] = ActionDispatch::Http::UploadedFile.new(params[:file])
    #   cv = Cv.create(params)
    #   JobMailer.notify_candidate_apply_job.deliver_now
    #   present cv, with: API::Entities::V1::Cv
    # end

    desc 'Get CV',
         entity: API::Entities::V1::Cv
    params do
      optional :id, type: Integer, desc: 'CV ID'
    end
    get ':id' do
      cv = Cv.find_by(id: params[:id])
      present cv, with: API::Entities::V1::CvDetail
    end

    desc 'Get cvs with job id',
         entity: API::Entities::V1::Cv
    params do
      use :authorization_token
      requires :job_id
    end
    get do
      user = authenticate_user!
      job = user.jobs.find_by(id: params[:job_id])
      present job.cvs, with: API::Entities::V1::Cv
    end
  end
end
