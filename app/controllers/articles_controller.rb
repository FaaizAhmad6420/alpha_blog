class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was Created Successfully."
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was Updated Successfully."
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was Deleted Successfully."
      redirect_to articles_path
    else
      flash[:error] = "Error deleting article: #{@article.errors.full_messages.join(', ')}"
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
