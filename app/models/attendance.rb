# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  private

  def event_participation_send
    UserMailer.event_participation_email(User.find(user_id), Event.find(event_id)).deliver_now
  end
end
