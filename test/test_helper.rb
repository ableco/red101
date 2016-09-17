ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'sidekiq/testing'

PASSWORD     = '1234abcd'
MEMBER_TOKEN = '1234567890abcdefghijklmnopqrstuvwxyz'
ADMIN_TOKEN  = 'abcdefghijklmnopqrstuvwxyz1234567890'

class ActiveSupport::TestCase
  fixtures :all

  def v1_authorization_header(user)
    {
      'Authorization' => encode_token(user.devices.active.first.token)
    }
  end

  private

    def encode_token(token)
      ActionController::HttpAuthentication::Token.encode_credentials(token)
    end
end
