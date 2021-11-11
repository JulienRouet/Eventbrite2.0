# frozen_string_literal: true

class EventController < ApplicationController
  include EventHelper

  before_action :can_enter?, only: %i[new create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(Attendance.find_by(event: @event, creator: true).user_id)
    @attendances = Attendance.where(event: @event)
  end

  def new; end

  def create
    event = Event.new_event(params)
    if event.save
      Attendance.create(event: event, user: current_user, creator: true)
      redirect_to event_path(event.id), notice: 'évenement crée avec succés'
    else
      flash.now[:alert] = "Erreur lors de la creation de l'event, veuillez verifier le formulaire"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if Event.update_event(@event, params)
      redirect_to event_path(params[:id]), notice: 'event modifié'
    else
      flash.now[:alert] = 'Erreur, veuillez verifier le formulaire'
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to root_path, notice: 'event supprimé'
  end
end
