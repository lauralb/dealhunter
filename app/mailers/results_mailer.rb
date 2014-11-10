class ResultsMailer < ActionMailer::Base
  default :from =>  "noresponder@dealhunter.com"

  def results_email(company, offer)

    @offer = offer
    @prizes = Prize.all.delete_if {|x| x.offer_id != offer.id}
    @company = company
    client_offers = ClientsOffer.all.delete_if{|x| x.offer_id != offer.id && x.participated.nil?}
    client_offers.sort_by  {|x| x.position}
    @clients= []
    client_offers.each do |co|
      @clients << Client.find(co.client_id)
    end

    mail(:to => company.user.email, :subject => "Resumen de oferta #{offer.name}")
  end

end