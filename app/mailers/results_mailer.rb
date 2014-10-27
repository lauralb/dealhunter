class ResultsMailer < ActionMailer::Base
  default :from =>  "noresponder@dealhunter.com"

  def results(company, offer, prizes)

    @offer = offer
    @prizes = prizes
    @company = company
    @client = ClientsOffer.all.delete_if{|x| x.offer != offer && x.participated.nil?}.client

    mail(:to => company.email, :subject => "Resumen de oferta #{offer.name}")
  end

end