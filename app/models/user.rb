class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, :birthday ,presence: true

  has_many :tweets
  has_one :address #ログイン
  has_many :comments

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
