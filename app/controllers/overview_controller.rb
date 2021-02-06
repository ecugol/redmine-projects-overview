class OverviewController < ApplicationController
  include OverviewHelper
  before_action :require_login
  before_action :check_perm_and_redirect
  
  def index
    project_ids = EnabledModule.where(name: "projects_overview").pluck(:project_id)
    @all_projects = Project.active.where(id: project_ids).order(:name)
    if params[:selected_projects]
      @available_projects = @all_projects.where.not(id: params[:selected_projects])
      @selected_projects = @all_projects.where(id: params[:selected_projects])
    else
      @available_projects = @all_projects.none
      @selected_projects = @all_projects
    end
    @projects_num = @selected_projects.count
    @groups = Group.none
    unless Setting.plugin_projects_overview["overview_groups_selected"].nil?
      @groups = Group.where(id: Setting.plugin_projects_overview["overview_groups_selected"])
    end
  end

  def check_perm_and_redirect
		unless canAccessOverview
			render_403
			return false
		end
	end

end
