module ApplicationHelper
  def error_messages_for(model)
    return "" if model.errors.empty?
    render "errors/error_messages", errors: model.errors.full_messages
  end
end
