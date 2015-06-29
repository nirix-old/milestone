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
