class User < ApplicationRecord
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :balance, class_name: 'Balance', foreign_key: 'user_id'

  has_many :deposits
  has_many :withdraws
  has_many :transactions
  has_many :statements
end
