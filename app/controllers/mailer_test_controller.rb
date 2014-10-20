class MailerTestController <ApplicationController

  def winner_mailer
    render('game_winner_mailer/game_winner_email')
  end

  def looser_mailer
    render('game_looser_mailer/game_looser_email')
  end


end