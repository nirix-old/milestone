class ProjectSettings::VersionsController < ProjectSettings::ApplicationController
  def index
    @versions = current_project.versions
  end

  def new
    @version = current_project.versions.new
  end

  def create
    @version = current_project.versions.new version_params

    if @version.save
      redirect_to project_settings_versions_path
    else
      render :new
    end
  end

  def edit
    @version = current_project.versions.find(params[:id])
  end

  def update
    @version = current_project.versions.find(params[:id])
    @version.update_attributes version_params

    if @version.save
      redirect_to project_settings_versions_path
    else
      render :edit
    end
  end

  private

    def version_params
      params.require(:version).permit(:name, :slug, :description, :status)
    end
end
