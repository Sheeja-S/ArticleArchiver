class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :name, :uniqueness => true
  validates :email, :uniqueness => true
  has_secure_password

  has_many :articles_users
  has_many :articles, :through =>  :articles_users
end
