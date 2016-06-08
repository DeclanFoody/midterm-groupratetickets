#perform callback (after_create) if num_users > min_required, send sms message 
# to all users registered for this event

# require 'rubygems'          
# require 'twilio-ruby'


module TwilioH

  def send_sms
    account_sid = 'ACd457faa5071f4d14d07db69e0dc13157'
    auth_token = '6e2eb1b8a2a5abed7e72d60f46f44ca0'

    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
      :body => "Hey! Good news! Enough people have signed up for your event to qualify
      for the discounted price. Enjoy your Event! : )",
      :to => '+17786285667',
      :from => '+17786539148')
    puts message.body
  end

end



