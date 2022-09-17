class ArtifactsController < ApplicationController

    def index
        if params[:team_id].present?
            @artifacts = Team.find(params[:team_id]).artifacts
        else
            @artifacts = Artifact.all
        end
    end

     def show
        @artifact = Artifact.find(params[:id])
    end 
     
    def new
        @artifact = Artifact.new
    end

    def create
        @artifact = Artifact.new(artifact_params)

        if @artifact.save
            redirect_to organization_artifacts_path;
        else
            redirect_to organization_artifacts_path :alert => 'Unable to create user'
        end
    end


    def edit
        @artifact = Artifact.find(params[:id])
    end 

    def update
        @artifact = Artifact.find(params[:id])
    
        if @artifact.update(artifact_params)
            redirect_to organization_artifacts_path
        else
            redirect_to organization_artifacts_path, :alert => 'Unable to update user'
        end
    end

    def destroy 
        @artifact = Artifact.find(params[:id])
        @artifact.destroy            
       redirect_to organization_artifacts_path   
    end

     private
        def artifact_params
            params.require(:artifact).permit(:name)
        end
end
 