class Generator::ImageService
  IMAGES = [
    'https://i.ibb.co/NWrSrLR/Screen-Shot-2022-08-08-at-21-30-04.png',
    'https://i.ibb.co/mXwt5wb/Screen-Shot-2022-08-11-at-17-45-10.png',
    'https://i.ibb.co/58htpJz/Screen-Shot-2022-08-11-at-17-47-09.png',
    'https://techandenvironment.com/wp-content/uploads/2022/02/Ruby-Language.png',
    'https://static01.nyt.com/images/2022/04/04/multimedia/15ai-nocode/15ai-nocode-mobileMasterAt3x.jpg',
    'https://media.techmaster.vn/api/fileman/Uploads/ImageBlog/hoc-lap-trinh-web-php-truc-tuyen-24102015.png'
  ].freeze

  def self.image
    IMAGES.sample
  end
end
