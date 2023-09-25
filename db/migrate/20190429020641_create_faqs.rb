class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :description

      t.timestamps
    end
  end
end
