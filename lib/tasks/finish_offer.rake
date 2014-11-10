task :finish_offer => :environment do
  offers = Offer.get_newly_finalized_offers

  offers.each do |offer|
    offer.assign_positions
    clientsOffer = ClientsOffer.where(:offer_id=>offer.id)
    clientsOffer.each do |clientOffer|
      client = Client.find(clientOffer.client_id)
      prizes = Prize.find_all_by_offer_id(clientOffer.offer_id)

      if clientOffer.position <= offer.prizes.size ? GameWinnerMailer.game_winner_email(client.user,
                                                                                offer,
                                                                                clientOffer.position,
                                                                                offer.prizes[clientOffer.position - 1],
                                                                                Offer.get_other_offers).deliver!
      : GameLooserMailer.game_looser_email(client.user,
                                                   offer,
                                                   clientOffer.position,
                                                   Offer.get_other_offers).deliver!
      end
    end
    offer.finalization_checked = true
    offer.save!
  end

end
