# frozen_string_literal: true

class UserController < ApplicationController
  include UserHelper

  before_action :can_enter?

  def show
    @user = User.find(params[:id])
    @events = []
    Attendance.where(user: @user, creator: true).each do |event|
      @events << Event.find(event.event_id)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description]
    )
  end
end
