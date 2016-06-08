class Event < ActiveRecord::Base
  has_many :registrations  
  has_many :users, through: :registrations 

  validates :name, :date, :num_user, :reg_price, :disc_price, :image_url, :location, presence: true 
  validates :min_required, presence: true
  validates :num_user, numericality: { only_integer: true }
  validates :reg_price, :disc_price, numericality: { greater_than: 0 }



end