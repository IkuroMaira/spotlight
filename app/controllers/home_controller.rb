class HomeController < ApplicationController
  def index
    @mapbox_token = ENV['MAPBOX_ACCESS_TOKEN']
  end
end
