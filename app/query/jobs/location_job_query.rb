module Jobs
  class LocationJobQuery < Patterns::Query
    queries Job

    private

    def query
      downcase_location = options[:location].downcase
      if downcase_location == 'ho chi minh'
        location = 'hồ chí minh'
        return relation.where('province iLIKE ?', "%#{location.titleize}%")
      end
      if downcase_location == 'ho noi'
        location = 'hà nội'
        return relation.where('province iLIKE ?', "%#{location.titleize}%")
      end
      if downcase_location == 'da nang'
        location = 'đà nẵng'
        return relation.where('province iLIKE ?', "%#{location.titleize}%")
      end
      if downcase_location == 'hue'
        location = 'huế'
        return relation.where('province iLIKE ?', "%#{location.titleize}%")
      end
      relation.where('province iLIKE ?', "%#{downcase_location.titleize}%")
    end
  end
end

# Ref: https://github.com/nguyenvanhuan243/pattern
