class TemplatesController < ApplicationController
  include Rest

  private

  def permitted_attributes
    %i(name).push(topics_attributes: %i(id))
  end
end
