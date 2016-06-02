# Homepage (Root path)
get '/' do
  erb :index
end
get '/contacts' do
  Contact.all.to_json
end

post '/contacts' do
 firstname= params[:firstname]
 lastname= params[:lastname]
 email= params[:email]
 phone = params[:phone]
 results= {result: false}

 contact = Contact.new(firstname: firstname, lastname: lastname, email: email, phone: phone)
  if contact.save
    results[:result] = true
    results[:id] = contact.id
  end
  results.to_json
end

get '/contacts' do
  @contact = Contact.find(params[:id])
  @contact.destroy
end

get '/search/:txt' do
  # Contact.where("name LIKE ?","'%#{params[:txt]}%'")
  Contact.where(firstname: params[:txt]).to_json
end
