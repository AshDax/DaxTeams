class UsersController < ApplicationController
    
    before_action :authenticate_user!
 
    def index 
        @users = User.all
        authorize User
    end 
    
    def show
        @user = User.find(params[:id])
        authorize @user
    end
  
    def edit
        @user = User.find(params[:id])
        authorize @user
    end 

    def update
        if params[:team_id_new].present?
            @user = User.find(params[:emp])
 
            if @user.update(:team_id =>nil)
                redirect_to organization_teams_path, :success => 'Team Updated'   
            else 
                redirect_to organization_teams_path, :alert => 'Unable to Update Team'
            end

        elsif params[:emp].present?
            @user = User.find(params[:emp])
            authorize @user

            if @user.update_attributes(user_params)
                redirect_to organization_teams_path, :success => 'Team Updated'
            else
                redirect_to organization_teams_path, :alert => 'Unable to Update Team'
            end
        else
            @user = User.find(params[:id])
            authorize @user

            if @user.update_attributes(secure_params)
                redirect_to organization_users_path, :success => 'User updated'
            else
                redirect_to organization_users_path, :alert => 'Unable to update user'
            end
        end
    end

    def destroy
        user = User.find(params[:id])
        authorize user
        authorize user
        user.destroy
        redirect_to organization_users_path, :notice => "User deleted"
    end

    private

    def secure_params
        params.require(:user).permit(:role)
    end
    
    def user_params
        params.permit(:team_id)
    end
end
