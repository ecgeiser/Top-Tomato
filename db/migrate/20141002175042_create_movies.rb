class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :critics_score
      t.string :release_date

      t.timestamps
    end
  end
end
