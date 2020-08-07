class Admin::DashboardController < ApplicationController
  layout 'material-dashboard'
  def index
    @addresses = Address.all
    
  end
end
