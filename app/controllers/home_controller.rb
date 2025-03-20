class HomeController < ApplicationController
  def index
    render :index # Ensures Rails renders `home/index.html.erb`
  end
end
