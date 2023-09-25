class AddJobDescriptionLinkToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_description_link, :string
  end
end
