class Favorite < ActiveRecord::Base
	belongs_to :users, dependent: :destroy
	belongs_to :movies, dependent: :destroy
end