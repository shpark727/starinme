class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :version_code
      t.string :version_name
      t.string :platform
      t.boolean :forced

      t.timestamps
    end
  end
end
