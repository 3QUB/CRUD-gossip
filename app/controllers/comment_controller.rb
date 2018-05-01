class CommentController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(anonymous_author: params["anonymous_author"], body: params["body"], gossip_id: params["gossip-id"])
    @comment.save
    redirect_to gossip_path(@comment.gossip_id)
  end

  def edit 
    @comment = Comment.find(params[:id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    permitted_columns = params.require(:comment).permit(:anonymous_author, :body)
    @comment.update_attributes(permitted_columns)

    redirect_to gossip_path(@comment.gossip_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  
    redirect_to gossip_path(@comment.gossip_id), notice: "Delete success"
  end

end
