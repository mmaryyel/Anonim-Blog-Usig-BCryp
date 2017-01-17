class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  belongs_to :user
end
