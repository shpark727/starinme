class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.string :comment
      t.integer :project_id
      t.integer :user_id
      t.string :status
      t.date :read
      t.date :cancaled

      t.timestamps
    end
  end
end
