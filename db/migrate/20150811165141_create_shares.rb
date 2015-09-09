class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :posting_id
      t.integer :user_id
      t.string :outer_url
      t.string :outer_platform

      t.timestamps
    end
  end
end
