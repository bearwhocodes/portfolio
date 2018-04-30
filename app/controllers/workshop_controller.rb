class WorkshopController < ApplicationController

  # GET /workshop
  def index
    @pens = Pen.all
  end

  # GET /workshop/1
  def show
    @pen = Pen.find(params[:id])
  end

end
