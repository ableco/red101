ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

PASSWORD     = '1234abcd'
MEMBER_TOKEN = '1234567890abcdefghijklmnopqrstuvwxyz'
ADMIN_TOKEN  = 'abcdefghijklmnopqrstuvwxyz1234567890'

class ActiveSupport::TestCase
  fixtures :all
end
