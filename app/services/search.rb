require 'meilisearch'

class Search
  def initialize
    @client = MeiliSearch::Client.new(ENV['MEILI_URL'], ENV['MEILI_MASTER_KEY'], timeout: 15)
  end

  def add_documents(index = "search_all", keyword)
    data = find_keyword(keyword)
    @client.index(index).add_documents(data)
  end

  def delete_documents(index = "search_all")
    @client.index(index).delete_all_documents
  end

  def find_keyword(keyword)
    array_result = []
    results      = Job.search_by_title(keyword)
    results      = Job.all unless results.present?
    results.each do |item|
      array_result << {
        id:    item.id,
        title: item.title,
        data:  item
      }
    end
    array_result
  end

  def search_with_index(index = "search_all", keyword)
    # search khoảng trắng, có dấu, chữ hoa thường ==> search bắt đầu bằng từ đầu của mỗi từ
    results = []
    items   = @client.index(index).search(keyword)["hits"]
    if !items.blank?
      items.each do |item|
        results << {
          title: item["title"],
          id:    item["id"]
        }
      end
    else
      Job.all.pluck(:title, :id).map do |title, id|
        results << { title: title, id: id }
      end
    end
    results
  end
end

# Search.new.add_documents("search_all", 'xxx')
# Search.new.search_with_index("search_all", 'rails')