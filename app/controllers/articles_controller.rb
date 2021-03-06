class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  
	def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

	def create
    a = current_user.articles.new(article_params)
    if a.save
     redirect_to a, notice: "New article created!"
    else
    render 'new'
    end 

	end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
 
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :price, {images: []}, :category_id, :type_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
