# frozen_string_literal: true

class ChargesController < ApplicationController
  include ChargesHelper

  def new
    free?(Event.find(params[:event_id]))
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    begin
      Checkout.new(@event.price, params)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_charge_path(event_id: event.id)
    end
    Attendance.create(event: @event, user: current_user)
  end
end
