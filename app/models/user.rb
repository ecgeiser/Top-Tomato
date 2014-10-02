class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :cell, numericality: { only_integer: true }, length: { is:10 }, presence: true
  validates :zip, numericality: { only_integer: true }, length: { is:5 }, presence: true
end
