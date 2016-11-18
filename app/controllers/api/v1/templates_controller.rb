class Api::V1::TemplatesController < TemplatesController
  skip_before_action :verify_authenticity_token
end
