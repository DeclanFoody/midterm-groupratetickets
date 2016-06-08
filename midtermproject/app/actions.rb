# Homepage (Root path)

require_relative 'views/helper'

helpers do
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
end


get '/' do
  @images = Image.all
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password], phone_number: params[:phone])
  session[:user_id] = @user.id
  redirect '/events'
end


get '/events' do
  @events = Event.all
  erb :'events/index'
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :'event_id'
end

get '/events/:id/payment' do
  @event = Event.find(params[:id])
  erb :'payment_id'
end

get '/my_event' do
  # TODO current_user.events
  # @registration = Registration.find(current_user.id)
  @user_events = current_user.events
  erb :'my_event'
end


get '/registration/:event_id/remove' do 
  # TODO: change 3 by current_user.id
  Registration.find_by(event_id: params[:event_id], user_id: current_user).destroy
  redirect '/my_event'
end

post '/events/:id/payment' do
  @event = Event.find(params[:event_id])

  if current_user
    current_user.update(phone_number: params[:phone], email: params[:email])
    @registration = Registration.create(
    user_id: current_user.id,
    event_id: @event.id,
    num_tickets: params[:num_tickets])

    @event.num_user += params[:num_tickets].to_i
    @event.save
    redirect '/my_event'
  else
    redirect '/login'
  end
end





