class Api::V1::DiagnosticsController < DiagnosticsController
  skip_before_action :verify_authenticity_token
end
