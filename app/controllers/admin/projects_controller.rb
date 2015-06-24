class Admin::ProjectsController < Admin::ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    @project.update_attributes project_params

    if @project.save
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :slug, :description)
    end
end
