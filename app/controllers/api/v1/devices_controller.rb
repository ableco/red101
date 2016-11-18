class Api::V1::DevicesController < DevicesController
  skip_before_action :verify_authenticity_token
end
