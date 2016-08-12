class LandingController < ApplicationController
  def index
    @landing_props = { name: "Stranger" }
  end
end
