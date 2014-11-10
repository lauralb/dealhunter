task :finish_offer => :environment do
  offers = Offer.get_newly_finalized_offers

  offers.each do |offer|
    offer.assign_positions
    clientsOffer = ClientsOffer.where(:offer_id=>offer.id)
    clientsOffer.each do |clientOffer|
      client = Client.find(clientOffer.client_id)
      if clientOffer.position == 1 ? GameWinnerMailer.game_winner_email(client.user,
                                                                                offer,
                                                                                clientOffer.position,
                                                                                offer.prizes.first,
                                                                                Offer.all).deliver!
      : GameLooserMailer.game_looser_email(client.user,
                                                   offer,
                                                   clientOffer.position,
                                                   Offer.all).deliver!
      end
    end
    offer.finalization_checked = true
    offer.save!
  end

end
