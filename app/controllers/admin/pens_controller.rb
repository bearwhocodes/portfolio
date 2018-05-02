class Admin::PensController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pen, only: [:show, :edit, :update, :destroy]

  layout "admin"

  # GET /admin/pens
  def index
    @pens = Pen.all
  end

  # GET /admin/pens/1
  def show
    redirect_to edit_admin_pen_path(@pen)
  end

  # GET /admin/pens/new
  def new
    @pen = Pen.new
  end

  # GET /admin/pens/1/edit
  def edit
  end

  # POST /admin/pens
  def create
    @pen = Pen.new(pen_params)

    if @pen.save
      redirect_to admin_pens_path, notice: 'Pen was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/pens/1
  def update
    if @pen.update(pen_params)
      redirect_to admin_pens_path, notice: 'Pen was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/pens/1
  def destroy
    @pen.destroy
    redirect_to admin_pens_url, notice: 'Pen was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pen
      @pen = Pen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pen_params
      params.require(:pen).permit(:name, :summary, :codepen_url, :archived, :image)
    end
end
