class StaticController < ApplicationController
  require 'gossip'
  def team 
  end


  def contact
  end

  def welcome
    @user = params[:id]
  end

  def index
    @gossip = Gossip.all
  end

  def show
  end
end