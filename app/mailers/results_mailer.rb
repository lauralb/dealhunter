class ResultsMailer < ActionMailer::Base
  default :from =>  "noresponder@dealhunter.com"

  def results_mailer(company, offer)

    @offer = offer
    @prizes = Prize.all.delete_if{|x| x.offer != offer}
    @company = company
    @clients = ClientsOffer.all.delete_if{|x| x.offer != offer && x.participated.nil?}.client

    mail(:to => company.email, :subject => "Resumen de oferta #{offer.name}")
  end

end