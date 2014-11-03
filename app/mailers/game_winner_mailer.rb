class GameWinnerMailer < ActionMailer::Base
  default :from => "noresponder@dealhunter.com"

  def game_winner_email(user, offer, position, prize, other_offers)
    @user = user
    @offer = offer
    @prize = prize
    @position = position
    @offers = other_offers
    mail(:to => @user.email, :subject => 'Has ganado!')
  end

end