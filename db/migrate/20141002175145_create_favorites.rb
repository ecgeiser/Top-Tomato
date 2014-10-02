class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.string :user_id, index: true
    	t.string :movie_id, index: true
    end
  end
end
