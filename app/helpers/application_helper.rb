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

  def active_nav(pattern)
    if request_matches(pattern)
      raw ' class="active"'
    else
      ''
    end
  end
end
