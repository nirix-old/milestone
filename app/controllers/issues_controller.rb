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

class IssuesController < ApplicationController
  def index
    @issues = current_project.issues.all
  end

  def new
    @issue = current_project.issues.new
  end

  def create
    @issue = current_project.issues.new issue_params
    @issue.user = current_user

    if @issue.save
      redirect_to project_issue_path(current_project.slug, @issue.id)
    else
      render :new
    end
  end

  def show
    begin
      @issue = current_project.issues.find params[:id]
    rescue
      return render_404 if not @issue
    end
  end

  private

    def issue_params
      params.require(:issue).permit([
        :summary,
        :description,
        :version_id,
        :type_id,
        :status_id
      ])
    end
end
