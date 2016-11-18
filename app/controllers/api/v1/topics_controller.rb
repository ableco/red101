class Api::V1::TopicsController < TopicsController
  skip_before_action :verify_authenticity_token
end
