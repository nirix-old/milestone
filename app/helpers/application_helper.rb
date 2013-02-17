module ApplicationHelper
  ##
  # Easily display model errors.
  #
  # @param [Object] model The model containing errors.
  #
  # @return [String]
  #
  # @example
  #     <%=show_errors_for @user %>
  #
  def show_errors_for(model)
    render 'errors/errors_for', model: model
  end
end
