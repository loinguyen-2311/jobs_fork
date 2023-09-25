class Job::Faking::JobCategoryService
  def self.call
    create_job_category
  end

  def self.create_job_category
    [
      'Software Engineering'
    ].sample
  end
end
