module OverviewHelper
    def canAccessOverview
        result = false
        if User.current.logged?
            User.current.groups.pluck(:id).each do |group_id|
                unless Setting.plugin_projects_overview["overview_groups"].nil?
                    Setting.plugin_projects_overview["overview_groups"].each do |settings_group_id|
                        if group_id.to_s == settings_group_id.to_s
                            result = true
                            break
                        end
                    end
                end
            end
        end
        result
    end
end
