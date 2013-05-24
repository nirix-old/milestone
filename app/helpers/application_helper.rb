module ApplicationHelper
  def error_messages_for(model)
    return "" if model.errors.empty?
    render "errors/error_messages", errors: model.errors.full_messages
  end

  def flash_messages
    return unless flash.count

    messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      messages.push({ type: type, message: message })
    end

    render 'layouts/flash_messages', messages: messages
  end
end
