class Job::Faking::CompanyLogoService
  def self.call
    create_company_logo
  end

  def self.create_company_logo
    [
      'https://www.consoft.vn/uploads/products/25709_lumenrt_connectedition_icon.png'
    ].sample
  end
end
