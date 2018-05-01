class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  def index
    @articles = Article.all
  end

  # GET /admin/articles/1
  def show
    redirect_to edit_admin_article_path(@article)
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_url, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/articles/1
  def update
    if @article.update(article_params)
      redirect_to admin_articles_url, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/articles/1
  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :summary, :published_at, :archived, :image, :content)
    end
end
