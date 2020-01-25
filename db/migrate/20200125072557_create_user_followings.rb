class CreateUserFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_followings do |t|
      t.integer :user_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
