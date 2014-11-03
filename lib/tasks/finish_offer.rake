task :finish_offer => :environment do
  offers = Offer.get_newly_finalized_offers
  offers.each do |offer|
    offer.assign_positions
  end
end
