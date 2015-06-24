module TwbsHelper
  def fa(cls, text = nil)
    text = " #{text}" if not text.nil?
    return raw("<span class=\"fa fa-#{cls}\"></span>#{text}")
  end
end
