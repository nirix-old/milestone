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

class Admin::IssueTypesController < Admin::ApplicationController
  def index
    @types = IssueType.all
  end

  def new
    @type = IssueType.new
  end

  def create
    @type = IssueType.new type_params

    if @type.save
      redirect_to admin_issue_types_path
    else
      render :new
    end
  end

  def edit
    @type = IssueType.find params[:id]
  end

  def update
    @type = IssueType.find params[:id]
    @type.update_attributes type_params

    if @type.save
      redirect_to admin_issue_types_path
    else
      render :edit
    end
  end

  private

    def type_params
      params.require(:issue_type).permit :name
    end
end
