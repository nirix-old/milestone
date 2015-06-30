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

class Admin::IssueStatusesController < Admin::ApplicationController
  def index
    @statuses = IssueStatus.all
  end

  def new
    @status = IssueStatus.new
  end

  def create
    @status = IssueStatus.new status_params

    if @status.save
      redirect_to admin_issue_statuses_path
    else
      render :new
    end
  end

  def edit
    @status = IssueStatus.find params[:id]
  end

  def update
    @status = IssueStatus.find params[:id]
    @status.update_attributes status_params

    if @status.save
      redirect_to admin_issue_statuses_path
    else
      render :edit
    end
  end

  private

    def status_params
      params.require(:issue_status).permit :name, :is_closed
    end
end
