class ProjectSettings::SettingsController < ProjectSettings::ApplicationController
  def index
    @project = Project.find_by(slug: current_project.slug)
  end
end
