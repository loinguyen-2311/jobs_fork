class AddCompanyLogoToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company_logo, :string
  end
end
