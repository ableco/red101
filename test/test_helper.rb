ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

PASSWORD = '1234abcd'
TOKEN    = '1234567890abcdefghijklmnopqrstuvwxyz'

class ActiveSupport::TestCase
  fixtures :all
end
