# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    layout 'material-dashboard'
    def index
      @addresses = Address.all
    end
  end
end
