Redmine::Plugin.register :projects_overview do
  name 'Projects Overview plugin'
  author 'Ivan Vedernikov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  menu :top_menu, :overview, { controller: 'overview', action: 'index' }, caption: 'Overview'
end
