class RootController < ApplicationController
  include ReactOnRails::Controller

  def index
    redux_store("UserContainer", props: {})
  end
end
