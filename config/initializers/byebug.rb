if Rails.env.development? && debug_port = ENV['DEBUG_PORT']
  require 'byebug/core'

  Byebug.wait_connection = true
  Byebug.start_server('localhost', debug_port.to_i)
end
