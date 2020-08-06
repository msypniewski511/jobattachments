class Admin::DashboardController < ApplicationController
  layout 'material-dashboard'
  def index
    @addresses = Address.all
    ApiCalls::JobsService.call
  end
end
