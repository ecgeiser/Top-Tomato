class Movie < ActiveRecord::Base
	has_many :comments
	belongs_to :user, through: :follower
end