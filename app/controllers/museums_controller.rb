class MuseumsController < ApplicationController
require 'json'
require 'open-uri'

  def index
    @museums = Museum.all
    @museums.get_museums(52.494857, 13.437641)
    render json: @museums
  end


end
