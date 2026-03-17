module ApplicationHelper
  def flash_class(message_type)
    case message_type.to_sym
    when :notice
      "alert alert-success"
    when :alert
      "alert alert-error"
    else
      "alert alert-info"
    end
  end
end
