class LoginController < ApplicationController

  def index
    @login = Login.all
  end

 def new
    @login = Login.new(user: "", password: "") 
  end


  def create
    @login = Login.new(user: params[:user], password: params[:password])
    #title: params[:title], content: params[:content], user: params[:user] # avec xxx qui sont les données obtenues à partir du formulaire

	if @login.save # essaie de sauvegarder en base @gossip
    redirect_to gossips_path
  else
   render 'new' # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end
	end
  
 
  def show
  end

  def edit
  end

end

private
	
def login_params
  params.require(:login).permit(:user, :password)
end