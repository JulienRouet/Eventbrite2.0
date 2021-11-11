# frozen_string_literal: true

class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :past?
  validates :duration, presence: true
  validate :duration_valid?
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, inclusion: { in: 0..1000 }
  validates :location, presence: true
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  def self.new_event(params)
    Event.new(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],
      price: params[:price],
      location: params[:location]
    )
  end

  def self.update_event(event, params)
    event.update(
      title: params[:title],
      start_date: params[:start_date],
      duration: params[:duration],
      location: params[:location],
      price: params[:price],
      description: params[:description]
    )
  end

  private

  def duration_valid?
    errors.add(:duration, 'la durée doit etre positive et incrémentée de 5 en 5') unless
      duration.positive? && (duration % 5).zero?
  end

  def past?
    return false if start_date.nil?

    errors.add(:start_date, 'la date ne doit pas etre dans le passé') unless
      start_date > Time.zone.now
  end
end
