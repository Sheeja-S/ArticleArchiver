class User < ActiveRecord::Base
  has_many :articles_users
  has_many :articles, :through =>  :articles_users
end
