class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Go back to sign-in page
  # ChatGPT
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  # Go to user page after log in
  # ChatGPT
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

end
