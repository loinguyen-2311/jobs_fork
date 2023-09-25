class Job::Faking::SalaryTextService
  def self.call
    create_salary
  end

  def self.create_salary
    [
      'From 2000$ To 4000$',
      'From 3000$ To 4000$',
      'From 2500$ To 3000$',
      'From 3500$ To 5000$',
      'From 3500$ To 4000$'
    ].sample
  end
end
