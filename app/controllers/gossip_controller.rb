class GossipController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def create 
    @gossip = Gossip.new(anonymous_author: params["anonymous_author"], content: params["content"])
    @gossip.save
    redirect_to gossip_path(@gossip)
  end

  def show 
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    permitted_columns = params.require(:gossip).permit(:anonymous_author, :content)
    @gossip.update_attributes(permitted_columns)

    redirect_to gossip_path(@gossip)
  end

  def destroy 
    @gossip = Gossip.find(params[:id])
    @gossip_comments = @gossip.comments
    @gossip_comments.destroy
    @gossip.destroy
  
    redirect_to gossip_index_path, notice: "Delete success"
  end

  def index
    @gossip = Gossip.all
  end
end
