module Admin::AdminHelper

  def admin_heading
    if controller_name == 'console'
      "Console"
    elsif action_name == 'index'
      controller_name.capitalize
    else
      "#{action_name} #{controller_name.singularize}".capitalize
    end
  end

end