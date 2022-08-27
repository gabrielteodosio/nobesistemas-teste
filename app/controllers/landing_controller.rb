class LandingController < ApplicationController
  def index
    @clients_count = User.count
  end
end
