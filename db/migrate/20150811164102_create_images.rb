class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :topic
      t.string :image_path
      t.integer :image_size
      t.integer :posting_id

      t.timestamps
    end
  end
end
