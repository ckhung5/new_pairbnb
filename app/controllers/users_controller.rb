

# class Clearance::UsersController < ApplicationController
  
#   def show
    
#     @user = User.find(params[:id])

#   end
# def user_from_params
#   user_params = params[:user] || Hash.new
#   email = user_params.delete(:email)
#   password = user_params.delete(:password)
#   name = user_params.delete(:name)

#   Clearance.configuration.user_model.new(user_params).tap do |user|
#     user.email = email
#     user.password = password
#     user.name = name
#   end
# end

# def permit_params
#   params.require(:user).permit(:name, :email, :password)
# end


# end
class UsersController < Clearance::UsersController

  def show
    
    @user = User.find(params[:id])

  end
   def edit
    
    
    
  end

  def update
    
    user = User.find(params[:id])
    user.email = params[:user][:email]
    user.name = params[:user][:name]
    user.image = params[:user][:image]
    user.status = params[:user][:status]
    user.save

    redirect_to user

  end



  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to '/'
    else
      render template: 'users/new'
    end 
  end 

  private

  def user_from_params
    
    user_params = params[:user] || Hash.new
    name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    status = user_params.delete(:status)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.name = name
      user.email = email
      user.password = password
      user.status = status.to_i
    end

  end

  # def user_params
  #   params.require(:user).permit(:name, :email, :password)
  # end
end