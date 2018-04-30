class Admin::PensController < ApplicationController
  before_action :set_pen, only: [:show, :edit, :update, :destroy]

  # GET /admin/pens
  # GET /admin/pens.json
  def index
    @pens = Pen.all
  end

  # GET /admin/pens/1
  # GET /admin/pens/1.json
  def show
  end

  # GET /admin/pens/new
  def new
    @pen = Pen.new
  end

  # GET /admin/pens/1/edit
  def edit
  end

  # POST /admin/pens
  # POST /admin/pens.json
  def create
    @pen = Pen.new(pen_params)

    respond_to do |format|
      if @pen.save
        format.html { redirect_to admin_pen_path(@pen), notice: 'Pen was successfully created.' }
        format.json { render :show, status: :created, location: @pen }
      else
        format.html { render :new }
        format.json { render json: @pen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pens/1
  # PATCH/PUT /admin/pens/1.json
  def update
    respond_to do |format|
      if @pen.update(pen_params)
        format.html { redirect_to admin_pen_path(@pen), notice: 'Pen was successfully updated.' }
        format.json { render :show, status: :ok, location: @pen }
      else
        format.html { render :edit }
        format.json { render json: @pen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pens/1
  # DELETE /admin/pens/1.json
  def destroy
    @pen.destroy
    respond_to do |format|
      format.html { redirect_to pens_url, notice: 'Pen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pen
      @pen = Pen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pen_params
      params.fetch(:pen, {})
    end
end
