Redmine::Plugin.register :projects_overview do
  name 'Projects Overview plugin'
  author 'Ivan Vedernikov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  menu :top_menu, :overview, { controller: 'overview', action: 'index' }, caption: 'Overview', :if => Proc.new {
    Object.new.extend(OverviewHelper).canAccessOverview
  }
  settings default: {'empty' => true}, partial: 'settings/project_overview_settings'
  project_module :projects_overview do
    permission :enable_overview, projects_overview: :index
  end
end

# puts User.current.groups.pluck(:id)