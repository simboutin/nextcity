module ApplicationHelper

  def current_user_is_not_ambassador?
    user_signed_in? && current_user.ambassador == false
  end

   def current_user_is_ambassador?
    user_signed_in? && current_user.ambassador == true
  end

end
