class VersionsController < ApplicationController
  def index
  end

  def show
    @version = Version.find_by(slug: params[:slug])
  end
end
