class Job::LuaGaService
  def self.call
    Job.lua_ga.create(
      user_id: User.first.id,
      benifit: faking_job_description,
      requirement: faking_job_description,
      description: faking_job_description,
      title: faking_job_title,
      city: 'Remote',
      company_name: faking_company_name,
      salary_type: 'Full Time',
      salary_text: faking_salary_text,
      company_logo: faking_company_logo,
      category: faking_job_category,
      province: faking_province,
      sync_from_partner: 1
    )
  rescue StandardError => e
    puts "exception: #{e}"
  end

  def self.faking_job_title
    Job::Faking::JobTitleService.call
  end

  def self.faking_salary_text
    Job::Faking::SalaryTextService.call
  end

  def self.faking_company_name
    Job::Faking::CompanyNameService.call
  end

  def self.faking_job_description
    Job::Faking::JobDescriptionService.call
  end

  def self.faking_company_logo
    Job::Faking::CompanyLogoService.call
  end

  def self.faking_job_category
    Job::Faking::JobCategoryService.call
  end

  def self.faking_province
    Job::Faking::ProvinceService.call
  end
end
