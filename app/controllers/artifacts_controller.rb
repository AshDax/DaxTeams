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
            redirect_to organization_artifacts_path :alert => 'Unable to create artifact'
        end
    end


    def edit
        @artifact = Artifact.find(params[:id])
        @teams = Team.all
    end 

    def update
        if params[:artifact_id_new].present?
            @artifact = Artifact.find(params[:artifact])
            if @artifact.update(:team_id => nil)
                redirect_to organization_artifacts_path   
            else 
                redirect_to organization_artifacts_path, :alert => 'Unable to Update Team'
            end
        else
            @artifact = Artifact.find(params[:id])
        
            if @artifact.update(artifact_params)
                redirect_to organization_artifacts_path
            else
                redirect_to organization_artifacts_path, :alert => 'Unable to update artifact'
            end
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
  