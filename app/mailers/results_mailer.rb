class ResultsMailer < ActionMailer::Base
  default :from =>  "noresponder@dealhunter.com"

  def results(company, offer, prizes)
    @offer = Offer.find(offer)
    @prizes = Prize.find(offer)
    @company = company
    mail(:to => company.email, :subject => "Resumen de oferta #{offer.name}")
  end


end