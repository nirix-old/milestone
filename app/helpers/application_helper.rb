module ApplicationHelper
  def error_messages_for(model)
    return "" if model.errors.empty?
    render "errors/messages_for", errors: model.errors.full_messages
  end

  def error_messages_panel_for(model, options = {})
    return "" if model.errors.empty?
    options[:title] = t(:please_correct_the_following_errors) unless options.include? :title
    render "errors/error_messages_panel", options.merge({ errors: model.errors.full_messages })
  end

  def flash_messages
    return unless flash.count

    messages = []

    flash.each do |type, message|
      type = :warning if type == :notice
      type = :danger  if type == :alert
      messages.push({ type: type, message: message })
    end

    render 'layouts/flash_messages', messages: messages
  end
end
