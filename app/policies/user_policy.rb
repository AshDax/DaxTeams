class UserPolicy
    attr_reader :current_user, :model

    def initialize(current_user, model)
        @current_user = current_user
        @user = model
    end

    def index?
        @current_user.admin?
    end

    def show?
        @current_user.admin? or @current_user.team_leader?
    end

    def new?
        @current_user.admin? 
    end

    def create?
        @current_user.admin? 
    end
    def update?
        true
    end
    def edit?
        @current_user.admin? or @current_user.team_leader?
    end

    def destroy?
        @current_user.admin? or @current_user.team_leader?
    end
end