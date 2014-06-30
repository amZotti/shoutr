class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower, index: true, null: true
      t.belongs_to :followed_user, index: true, null: true

      t.timestamps null: true
    end
    add_index :following_relationships, [:follower_id, :followed_user_id], unique: true, name: "following_relation_unique_constraint"
  end
end
