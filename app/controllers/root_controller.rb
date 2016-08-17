class RootController < ApplicationController
  include ReactOnRails::Controller

  skip_before_action :authorize, only: :index

  def index
    redux_store("Store")
  end
end
