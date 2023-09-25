class AddFaqTypeToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :faq_type, :integer
  end
end
