# frozen_string_literal: true

module ChargesHelper
  def free?(event)
    return unless event.price.zero?

    Attendance.create(event: event, user: current_user)
    redirect_to event_path(params[:event_id]), notice: 'participation prise en compte'
  end
end
