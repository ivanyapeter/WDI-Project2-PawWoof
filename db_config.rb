require 'active_record'
require 'carrierwave'

###########################################################
###  Connecting Dish to database
###  
options = {
  adapter: 'postgresql',
  database: 'puppylove'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)