require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
# require 'carrierwave/orm/activerecord'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/dog'
require_relative 'models/breed'
require_relative 'models/breed_type'
# require_relative 'models/image_uploader'


enable :sessions

helpers do

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do

  erb :index
end


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Authenticate
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get '/signup' do
  erb :signup
end

post '/register' do
  user = User.new(email: params[:email], password: params[:password], firstname: params[:firstname], lastname: params[:lastname], address: params[:address], phone_number: params[:phone_number], avatar: "Nothing for now")
  if user.save
    session[:user_id] = user.id
    redirect to '/'
  else
    redirect to '/signup'
  end
end

get '/signin' do
  erb :signin
end

post '/session' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to '/'
  else
    redirect to '/signin'
  end

end

delete '/session' do
  session[:user_id] = nil
  redirect to '/'
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The main attraction!
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get '/dogs' do
  @dogs = Dog.all
  erb :dog_list
end 

get '/dogs/:name/:id' do

  dog_details = Dog.find(params[:id])
  @name = dog_details.name
  @age = dog_details.age
  @weight = dog_details.weight
  @vetapr = dog_details.vetapr
  @dog_img = dog_details.dog_img

  erb :dog_detail
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DASHBOARD
#
# Need to connect Dog with Breed Table
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
get '/dashboard' do

  erb :user_detail
end

get '/dashboard/dogs' do
  @user_dogs = Dog.where(user_id: current_user.id)
  @breeds = Breed.all
  erb :user_dog_list
end

get '/dashboard/:dog_name/:id' do
  dog_details = Dog.find(params[:id])
  @id = dog_details.id
  @name = dog_details.name
  @age = dog_details.age
  @weight = dog_details.weight
  @vetapr = dog_details.vetapr
  @breeds = dog_details.breeds
  @dog_img = dog_details.dog_img

  erb :user_dog_detail
end

post '/dashboard/dogs' do
  dog = Dog.new(name: params[:name], age: params[:age], weight: params[:weight], vetapr: 'Approved', dog_img: params[:dog_img], user_id: current_user.id)
  dog.breeds << Breed.find_by(id: params[:breed_id])
  if dog.save
    redirect to '/dashboard/dogs'
  else
    redirect to '/dashboard/new'
  end
end

get '/dashboard/:dog/:id/edit' do
  dog_details = Dog.find(params[:id])
  @breeds = Breed.all
  @id = dog_details.id
  @name = dog_details.name

  erb :user_dog_edit
end

put '/dashboard/:dog/:id/edit' do
  @dog_details = Dog.find(params[:id])
  @dog_details.name = params[:name]
  @dog_details.age = params[:age]
  @dog_details.weight = params[:weight]
  @dog_details.dog_img = params[:dog_img]
  @dog_details.breeds = [Breed.find_by(id: params[:breed_id])]
  
  if @dog_details.save
    redirect to '/dashboard/dogs'
  else
    redirect to '/dashboard/new'
  end
end

delete '/dashboard/:dog/:id/remove' do
  dog = Dog.find(params[:id])
  if dog.destroy
    redirect to '/dashboard/dogs'
  end
end



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Authenticate
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  #########################################
  ## Signup (POST)
  # user = User.new(email: params[:email], password_digest: params[:password], firstname: params[:firstname], lastname: [:lastname], address: [:address], phone_number: [:phone_number], avatar: [:avatar])
  # user.save

  #########################################
  ## Signin (POST)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The main attraction!
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  #########################################
  # Show all Dog in database (GET)    
  # @dogs = Dog.all
  # Iterate on erb file (look at index.erb goodfoodhunting)

  #########################################
  # Show Dog's details (GET)    
  # See if you can reuse the code in LOGGED IN USERS AREA

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DASHBOARD
#
# Need to connect Dog with Breed Table
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  #########################################
  ## Show all User's Dog (GET)
  # user_dogs = Dog.where(user_id: params[:user_id])
  # Iterate on erb file (look at index.erb goodfoodhunting)

  #########################################
  ## Add a Dog (POST)
  # dog = Dog.new(name: params[:name], age: params[:age], weight: params[:weight], vetapr: params[:vetapr], user_id: params[user_id])

  #########################################
  ## Show Dog's detials (GET)
  # dog_details = Dog.find(params[:id])
  # @name = dog_details.name
  # @age = dog_details.age
  # @weight = dog_details.weight
  # @vetapr = dog_details.vetapr

  #########################################
  ## Edit a dog detials (PUT)
  # dog = Dog.update(name: params[:name], age: params[:age], weight: params[:weight], vetapr: params[:vetapr], user_id: params[user_id])
  # dog.save

  #########################################
  ## Delete a dog (DELETE)
  # dog = Dog.find(params[:id])
  # dog.destroy

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~