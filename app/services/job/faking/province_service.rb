class Job::Faking::ProvinceService
  def self.call
    create_province
  end

  def self.create_province
    [
      'Remote'
    ].sample
  end
end
