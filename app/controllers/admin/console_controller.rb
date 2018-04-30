class Admin::ConsoleController < ApplicationController
  before_action :authenticate_user!

  # GET /admin/console/home
  # GET /admin
  def home

  end
  
end