require 'spec_helper'

describe IssuesController do
  it "should list issues" do
    get 'index'
    response.should render_template(:index)
  end
end
