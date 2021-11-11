# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'talmidiel.officiel@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://eventbrite-remastered.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def event_participation_email(user, event)
    @user = user
    @event = event
    @url = 'https://eventbrite-remastered.herokuapp.com/'
    mail(to: @user.email, subject: 'Votre participation a un evenement')
  end
end
