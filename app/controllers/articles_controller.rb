class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource
  
  def index
    if params[:title]
      search_term = params[:title]
      @articles = Article.search(search_term)
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end  

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      puts "Rendering with errors"
      puts @article.errors.full_messages
      render 'new'
    end    
  end

  def update
    @article = Article.find(params[:id])

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
  

  private
  def article_params
    params.require(:article).permit(:title, :text, :author)
  end
  
end
