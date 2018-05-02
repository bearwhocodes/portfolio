class Admin::TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]

  layout "admin"

  # GET /admin/technologies
  def index
    @technologies = Technology.all
  end

  # GET /admin/technologies/1
  def show
    redirect_to edit_admin_technology_path(@technology)
  end

  # GET /admin/technologies/new
  def new
    @technology = Technology.new
  end

  # GET /admin/technologies/1/edit
  def edit
  end

  # POST /admin/technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to admin_technologies_url, notice: 'Technology was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/technologies/1
  def update
    if @technology.update(technology_params)
      redirect_to admin_technologies_url, notice: 'Technology was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/technologies/1
  def destroy
    @technology.destroy
    redirect_to admin_technologies_url, notice: 'Technology was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technology_params
      params.require(:technology).permit(:name, :icon)
    end
end
