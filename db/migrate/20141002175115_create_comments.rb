class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :movie_id, index: true
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
