class FacebookService
  def initialize
    @job_ids = Job.dtalent.going.normal.pluck(:id).sample(3)
  end

  # Fanpage: https://www.facebook.com/fiojobexchange
  def post_to_fanpage
    job = Job.find(@job_ids.first)
    message = "🔥🔥🔥🔥👉 Đang Tuyển #{job.title} - Lương: #{job.salary_text} https://devfinding.com/single_job/#{job.id} 🔥🔥🔥🔥"
    post_with_graph_api(ENV['FANPAGE_ACCESS_TOKEN'], message, '964492397002271')
  end

  def post_to_groups
    job = Job.find(@job_ids.first)
    message = "@everyone Đang Tuyển #{job.title} - Lương: #{job.salary_text} 🔥🔥🔥🔥 👉https://devfinding.com/single_job/#{job.id}"
    group_ids = %w[1132359440916466 546543113607044 387558296716742]
    group_ids.map do |group_id|
      post_with_graph_api(ENV['FACEBOOK_GROUP_TOKEN'],
                          group_id == '546543113607044' ? "#{message}?from_leader=chu_anh" : message, group_id)
    end
  end

  private

  def post_with_graph_api(access_token, message, target_id)
    graph = Koala::Facebook::API.new(access_token)
    graph.put_picture(Generator::ImageService.image, { message: message }, target_id)
  end
end
