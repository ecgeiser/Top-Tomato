class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :movie_id, index: true
      t.string :user_id, index: true
    end
  end
end
