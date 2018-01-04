class CommentsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.body.downcase().include? "shit"
        format.html { redirect_to @article, alert: 'You must check you language.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      elsif  @comment.save
        format.html { redirect_to @article, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to @article, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end  
    end
  end  


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
