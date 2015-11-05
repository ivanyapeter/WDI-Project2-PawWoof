require 'active_record'

# show the sql in the terminal
ActiveRecord::Base.logger = Logger.new(STDERR)

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/dog'
require_relative 'models/breed'
require_relative 'models/breed_type'
require_relative 'models/message'


binding.pry