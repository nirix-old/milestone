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

  private

    def issue_params
      params.require(:issue).permit(:summary, :description, :version_id)
    end
end
