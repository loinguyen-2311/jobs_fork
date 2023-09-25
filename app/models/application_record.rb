class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def base_url
    url = Rails.application.routes.default_url_options[:host]
    url + (Rails.env.production? ? '' : ':3000')
  end

end
