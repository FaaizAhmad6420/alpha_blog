class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was Created Successfully."
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was Updated Successfully."
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article was Deleted Successfully."
      redirect_to articles_path
    else
      flash[:error] = "Error deleting article: #{@article.errors.full_messages.join(', ')}"
      redirect_to articles_path
    end
  end

end
