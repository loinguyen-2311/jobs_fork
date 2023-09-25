class Generator::JobTitleService
  JOB_TITLES = [
    'Ruby on Rails',
    'Laravel Developer',
    'React JS Developer',
    'Blockchain Developer',
    'Ruby Leader',
    'Remote Ruby',
    'Remote QC',
    'C++ Developer',
    'C# Developer',
    'Android Developer',
    'Remote Ruby Leader',
    'Technical .Net Leader',
    'iOS Developer',
    'Smart Contract Developer',
    'PHP Developer',
    'Database Management',
    'IT Helpdesk',
    'Project Manager',
    'Middle Ruby on Rails',
    'Blockchain',
    'VueJS',
    '.Net'
  ]

  def self.title
    JOB_TITLES.sample
  end
end
