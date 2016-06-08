class Registration < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  validates :num_tickets, presence: true
  validates :num_tickets, numericality: { only_integer: true }
  
  after_create :min_required_reached?

  def min_required_reached?
    # event = Event.find(params[:event_id])
    if event.num_user >= event.min_required
     
      TwilioH.send_sms()
      # event.users.each do |user|
      #   TwilioH.send_sms(user.phone_number)
      # end
    end
  end

end