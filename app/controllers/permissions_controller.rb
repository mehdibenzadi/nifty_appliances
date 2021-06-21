class PermissionsController < ApplicationController

  def create
    # make sure the appliance belongs to current_user
    @appliance = Appliance.find(params[:appliance_id])
    belongs_to_user = @appliance.user_id == current_user.id
    # is the email/user exists?
    email_exist = User.where(email: permission_params[:user_email]).exists?
    # Check if the user is repairer 
    if email_exist
      user_is_repairer = User.find_by(email: permission_params[:user_email]).repairer?
    end

    if (belongs_to_user && user_is_repairer)
      # Appliance belongs to current_user, allow to create permission
      @user_id = User.find_by(email: permission_params[:user_email]).id
      if Permission.where(appliance_id: params[:appliance_id], user_id: @user_id).exists?
        redirect_to appliance_path(@appliance), :alert => "Access was already granted to repairer #{permission_params[:user_email]}"
      else
        @permission = Permission.new
        @permission.appliance_id = params[:appliance_id]
        @permission.user_id = @user_id
        @permission.save
        redirect_to appliance_path(@appliance), :notice => "Successfully granted access to repairer #{permission_params[:user_email]}"
      end
    else
      if (email_exist == false)
      redirect_to appliance_path(@appliance), :alert => "User doesn't exist"
      elsif(user_is_repairer == false)
      redirect_to appliance_path(@appliance), :alert => "User is not a repairer"
      else
      redirect_to appliance_path(@appliance), :alert => "How did you get there?"
      end
    end
  end


  private
    def permission_params
      params.require(:permission).permit(:user_email)
    end

end
