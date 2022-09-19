class TeamsController < ApplicationController

    before_action :authenticate_user!
    # after_action :verify_authorized
  
    def index
        @teams = Team.all 
        authorize @teams
    end
  
    def show
        @team = Team.find(params[:id])
        authorize @team
    end 
     
    def new
        @team = Team.new
        @emps = User.where(team_id: nil)
        authorize @team
    end

    def create
        if params[:team_resource].present?
            teams = Team.find(params[:team_resource])
            artifact = Artifact.find([params[:artifact]])
            teams.artifacts << artifact
            teams.save
            redirect_to organization_teams_path(1)

        else
            @team = Team.new(team_params)
            # authorize @team
            if @team.save
                redirect_to action: 'index'
            else
                redirect_to team_path, :alert => 'Unable to create user'
            end
        end
    end


    def edit
        @team = Team.find(params[:id])
        @emps = User.where(team_id: nil)
        authorize @team
    end 

    def update
        @team = Team.find(params[:id])
        authorize @team 

        if @team.update(team_params)
            redirect_to action: 'index'
        else
            redirect_to team_path, :alert => 'Unable to update user'
        end
    end

    def destroy 
        @team = Team.find(params[:id])
        authorize @team
        team_member = @team.users
        deallocate_members(team_member)
        @team.destroy            
        redirect_to action: 'index'
        
    end

    private
        def team_params
            params.require(:team).permit(:name)
        end

        def deallocate_members(team_member)
            team_member.update(:team_id => nil)
        end
end
