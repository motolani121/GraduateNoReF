class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :user_id
      t.integer  :posts_id
      t.text :ccontent

      t.timestamps
    end
  end
end
