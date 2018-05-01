class Admin::TechnologiesController < ApplicationController
  before_action :set_technology, only: [:show, :edit, :update, :destroy]

  # GET /admin/technologies
  # GET /admin/technologies.json
  def index
    @technologies = Technology.all
  end

  # GET /admin/technologies/1
  # GET /admin/technologies/1.json
  def show
  end

  # GET /admin/technologies/new
  def new
    @technology = Technology.new
  end

  # GET /admin/technologies/1/edit
  def edit
  end

  # POST /admin/technologies
  # POST /admin/technologies.json
  def create
    @technology = Technology.new(technology_params)

    respond_to do |format|
      if @technology.save
        format.html { redirect_to admin_technology_path(@technology), notice: 'Technology was successfully created.' }
        format.json { render :show, status: :created, location: @technology }
      else
        format.html { render :new }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/technologies/1
  # PATCH/PUT /admin/technologies/1.json
  def update
    respond_to do |format|
      if @technology.update(technology_params)
        format.html { redirect_to admin_technology_path(@technology), notice: 'Technology was successfully updated.' }
        format.json { render :show, status: :ok, location: @technology }
      else
        format.html { render :edit }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/technologies/1
  # DELETE /admin/technologies/1.json
  def destroy
    @technology.destroy
    respond_to do |format|
      format.html { redirect_to admin_technologies_url, notice: 'Technology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technology_params
      params.fetch(:technology, {})
    end
end
