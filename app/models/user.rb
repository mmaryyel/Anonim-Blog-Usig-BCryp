class User < ActiveRecord::Base
  # Remember to create a migration!
  #Un usuario tiene muchos posts(relation: )
  has_many :posts
  validates :name, :email, :password, presence: true
  #validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

    def self.authenticate(email, password)
      user = User.find_by(email: email)
      user.password === password ? user : nil
    end
end



