class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :user_type
      t.string :sns_url
      t.text :biography
      t.string :facebook_id
      t.string :google_id
      t.string :facebook_token
      t.string :google_token
      t.date :last_login
      t.string :profile_image
      t.string :gender
      t.integer :age
      t.string :mobile_token
      t.string :mobile_secret
      t.date :mobile_token_created

      t.timestamps
    end
  end
end
