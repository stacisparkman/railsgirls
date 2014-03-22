class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render 'index'
  end

  def show
    @comment = Comment.find(params[:id])
    render 'show'
  end

  def new
    @comment = Comment.new
    render 'new'
  end

  def edit
    @comment = Comment.find(params[:id])
    render 'edit'
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to :back, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:user_name, :body, :idea_id)
  end

end
