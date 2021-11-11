# frozen_string_literal: true

module UserHelper
  def can_enter?
    redirect_to new_user_session_path, alert: 'veuillez vous connecter' if user_signed_in? == false
    return if current_user.id == params[:id].to_i

    redirect_to root_path, alert: 'veuillez vous connecter avec le bon compte utilisateur'
  end
end
