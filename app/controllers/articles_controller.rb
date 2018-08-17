class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    puts "------",params.inspect
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
    redirect_to @article
    else
      render 'new'
    end
  end

  def show
    #puts "-------------------"
    @article = Article.find(params[:id])

  end

  #strong parameters to prohibit mass fake assignment to db
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end


end
