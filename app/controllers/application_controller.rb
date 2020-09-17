# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Turbolinks::Redirection
  layout 'material-dashboard'
end
