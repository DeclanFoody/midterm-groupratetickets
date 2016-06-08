class User < ActiveRecord::Base
  has_many :registrations  
  has_many :events, through: :registrations 

  validates :username, :email, :password, presence: true
  # validates :username, length: { in 3..15 }
  # validates :password, length: { in 6..10 }  
end
