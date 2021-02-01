class OverviewController < ApplicationController
  before_action :require_login
  
  def index
    @all_projects = Project.active.order(:name)
    if params[:selected_projects]
      @available_projects = @all_projects.where.not(id: params[:selected_projects])
      @selected_projects = @all_projects.where(id: params[:selected_projects])
    else
      @available_projects = @all_projects.none
      @selected_projects = @all_projects
    end
    @projects_num = @selected_projects.count
    @groups = Group.where("UPPER(lastname) LIKE ?", "%TEAM%")
  end

end
