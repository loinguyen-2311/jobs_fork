class Job::Faking::CompanyNameService
  def self.call
    create_company_name
  end

  def self.create_company_name
    [
      'A software company',
      'A company about software',
      'A top company about software'
    ].sample
  end
end
