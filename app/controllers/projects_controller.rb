class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = current_project
  end
end
