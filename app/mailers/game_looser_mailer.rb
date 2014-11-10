class GameLooserMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def game_looser_email(user,offer,position,other_offers)
    @user = user
    @offer = offer
    @position = position
    @offers = other_offers
    mail(:to => @user.email, :subject => 'Dealhunter: Resultado de Oferta!')
  end


end