class CreatePublics < ActiveRecord::Migration
  def change
    create_table :publics do |t|
      t.string :title
      t.text :content
      t.string :topic

      t.timestamps
    end
  end
end
