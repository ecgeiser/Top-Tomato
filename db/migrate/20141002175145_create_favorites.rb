class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.references :user_id, index: true
    	t.references :movie_id, index: true
    end
  end
end
