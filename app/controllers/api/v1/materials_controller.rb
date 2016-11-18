class Api::V1::MaterialsController < MaterialsController
  skip_before_action :verify_authenticity_token
end
