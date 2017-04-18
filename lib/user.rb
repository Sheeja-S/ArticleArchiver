class User < ActiveRecord::Base
  has_secure_password
  has_many :articles_users
  has_many :articles, :through =>  :articles_users
end
