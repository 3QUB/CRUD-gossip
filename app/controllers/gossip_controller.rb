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
  end

  def destroy 
  end
end
