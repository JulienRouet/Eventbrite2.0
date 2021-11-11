# frozen_string_literal: true

module EventHelper
  def can_enter?
    redirect_to new_user_session_path, alert: 'veuillez vous connecter' unless user_signed_in?
  end

  def creator?
    attendance = Attendance.find_by(user: current_user, event_id: params[:id])
    return false unless user_signed_in?
    return false if attendance.nil?

    attendance.creator
  end

  def participating?
    true unless Attendance.find_by(user: current_user, event_id: params[:id]).nil?
  end
end
