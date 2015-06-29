# Milestone
# Copyright 2013-2015 Jack Polgar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
    @project = Project.find_by slug: params[:id]
  end

  def update
    @project = Project.find_by slug: params[:id]
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
