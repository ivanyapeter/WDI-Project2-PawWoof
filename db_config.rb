require 'active_record'
require 'carrierwave'

###########################################################
###  Connecting Dish to database
###  
options = {
  adapter: 'postgresql',
  database: 'pawwoof'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)