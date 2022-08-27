class User < ApplicationRecord
  include Gravtastic
  gravtastic

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :balance, class_name: 'Balance', foreign_key: 'user_id'

  has_many :deposits
  has_many :withdraws
  has_many :transactions
  has_many :statements

  validates :email, presence: { message: 'The Email field is required' }
  validates :email, uniqueness: { message: 'This Email is already registered' }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Please enter a valid email' }
  validates :password, presence: { message: 'The Password field is required' }
  validates :password, length: { in: 6..20, message: 'Min. of 6 and Max. 20 chars' }
  validates :first_name, presence: { message: 'The First Name field is required' }
  validates :last_name, presence: { message: 'This field is required' }

  before_create do
    self.balance = Balance.new
  end
end
