task :publish_offers => :environment do

  @user = Koala::Facebook::API.new('CAAV42X5Tty0BAGZA0kIdBxqero47da1ZAJ9fZB3FH59WUg7ZCW1ORb0Tk46eQTkUF8nyvb51z2LznIeRDCRBM9jCTRheZAd4wBHuxcE4vSucIZBt2MzQEiopPKt3AzNmRN2o4S54LTvkumBjWLHZA8cIMkKwlUENb6Vd4cBnmiOmi1GXhJd1ZAEqWOZALxBlvzNwZD')
  dealhunter = @user.get_connections('me', 'accounts')[1]
  page_id = dealhunter['id'] #this gets the dealhunters page id.
  page_access_token = dealhunter['access_token'] #this gets the dealhunters page token.
  @page = Koala::Facebook::API.new(page_access_token)

  Offer.all.each do |offer|
    if offer.start_date <= DateTime.now && !offer.publicated
      t = offer.name
      b = offer.description.first(50)+"..."  unless offer.description.nil?
      options = {
          :message     => "#{t}",
          :description => "#{b}",
          :link        => "http://localhost:3000/offers/#{(offer.id).to_s}"
#          :picture     => # "http://localhost:3000"+"#{offer.photo_url}"
      }
      @page.put_object(page_id, 'feed', options)
      offer.publicated = true
      offer.save!
    end
  end
end