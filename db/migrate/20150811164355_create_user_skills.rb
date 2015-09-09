class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.string :skill_name
      t.string :root_category
      t.string :child_category
      t.integer :child_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
