class Job::Faking::JobTitleService
  def self.call
    create_job_title
  end

  def self.create_job_title
    [
      'Remote Ruby on rails',
      'Remote Blockchain Developer',
      'Remote Golang Developer',
      'Remote PHP Developer',
      'Remote Smart Contract Developer',
      'Remote Ruby Leader',
      'Remote Senior Laravel',
      'Remote Middle Ruby',
      'Remote Middle Nodejs',
      'Remote Middle ReactJS',
      'Remote Senior C#',
      'Remote Senior C++',
      'Remote Senior Python',
      'Remote Senior Typescript',
      'Remote Middle C#',
      'Remote Middle C++',
      'Remote Middle Typescript',
      'Remote Middle NodeJS'
    ].sample
  end
end
