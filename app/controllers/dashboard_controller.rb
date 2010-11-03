class DashboardController < ApplicationController
  
  # let's show some stats!
  def index
    @total_enabled_users = Card.where(:disabled => "N").count
  end
end
