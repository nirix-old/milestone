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
