class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # attr_accessor :action , :user
  # def intialize
  #   @action = action
  #   @user = user
  # end

  def allowed?(action,user)

    if user.tenant?
      flash[:notice] = "Sorry. You are not allowed to perform this action as a tenant"
      return redirect_to action, notice:"Sorry. You can't list a property as a tenant"
    end



  end


end
