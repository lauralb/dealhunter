class MailerTestController <ApplicationController

  def winner_mailer
    @user = User.find(1)
    @offer = Offer.new
    @offer.name = ""
    @offers = Offer.all.take(5)
    @prize = Prize.new
    @prize.name= "yeah"
    @position = 1
    GameWinnerMailer.game_winner_email(@user, @offer, @position, @prize, @offers).deliver
    render('game_winner_mailer/game_winner_email')
  end

  def looser_mailer
    @user = User.find(1)
    @offer = Offer.new
    @offer.name = ""
    @offers = Offer.all.take(5)
    @position = 66
    GameLooserMailer.game_looser_mailer(@user, @offer, @position, @offers).deliver
    render('game_looser_mailer/game_looser_email')
  end


end