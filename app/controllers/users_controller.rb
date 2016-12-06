class UsersController < Clearance::UsersController

  def show
    
    @user = User.find(params[:id])

  end
  
  def edit
  end

  def update
    
    user = User.find(params[:id])
    user.update(email: params[:user][:email], name: params[:user][:name], image: params[:user][:image] , status: params[:user][:status])

    redirect_to user

  end


  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to '/'
    else
      render 'users/new'
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

end