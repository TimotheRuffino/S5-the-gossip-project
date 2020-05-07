class UsersController < ApplicationController

def new
  @user = User.new  
end

def create
  city_id = @city_id
  if params[:password] == params[:password_confirmation]
    @user = User.new( 'first_name' => params[:first_name],
                      'last_name' => params[:last_name],
                      'age' => params[:age],
                      'city_id' => City.all.sample.id , 
                      'email' => params[:email],
                      'password' => params[:password]
                      )
      if @user.save # essaie de sauvegarder en base @user
        flash.notice = "User successfully created"
        redirect_to root_path
      else
        flash.alert = "User can not be registred"
        render 'new'
        flash.alert = nil
      end
    end
end

def confirm 
  @user = User.find(params[:id])
  if @user.confirmation_token == params[:token]
    @user.update_attributes(confirmed: true, confirmation_token: nil)
    @user.save(validate: false)
    session[:auth] = {id: @user.id}
    redirect_to new_user_path, success: 'Votre compte a bien été confirmé'
  else
    redirect_to new_user_path, danger: 'Ce token ne semble pas valide'
end

end
private
	
def user_params
  params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :age, :city_id)
end
end