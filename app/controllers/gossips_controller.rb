class GossipsController < ApplicationController

	def new
		@gossip = Gossip.new
	end

	def create
    @gossip = Gossip.new(user: User.first, title: params[:title], content: params[:content])
    #title: params[:title], content: params[:content], user: params[:user] # avec xxx qui sont les données obtenues à partir du formulaire

	if @gossip.save # essaie de sauvegarder en base @gossip
    redirect_to gossips_path
  else
   render 'new' # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def index
		@gossip = Gossip.all
	end
end