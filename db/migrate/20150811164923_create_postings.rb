class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.text :content
      t.string :topic
      t.string :category
      t.integer :owner_id
      t.integer :child_category_id
      t.integer :root_category_id
      t.string :status
      t.date :start_date
      t.date :end_date
      t.string :main_image

      t.timestamps
    end
  end
end
