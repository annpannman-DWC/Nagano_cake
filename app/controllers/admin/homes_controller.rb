class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @params = params[:id]
  end
  
end
