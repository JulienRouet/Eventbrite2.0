# frozen_string_literal: true

class AttendancesController < ApplicationController
  def index
    @attendees = []
    Attendance.where(event_id: params[:event_id]).each do |attendee|
      @attendees << User.find(attendee.user_id)
    end
  end
end
