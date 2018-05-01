class CommentController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(anonymous_author: params["anonymous_author"], body: params["body"], gossip_id: params["gossip-id"])
    @comment.save
    redirect_to gossip_path(@comment.gossip_id)
  end

  def show
  end

  def update
  end

  def destroy
  end
end
