class User < ActiveRecord::Base
	has_many :movies, through: :favorites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :cell, length: { is:10 }, presence: true
  validates :zip, length: { is:5 }, presence: true


end
