task :publish_offers => :environment do

  @user = Koala::Facebook::API.new('CAAV42X5Tty0BAGZA0kIdBxqero47da1ZAJ9fZB3FH59WUg7ZCW1ORb0Tk46eQTkUF8nyvb51z2LznIeRDCRBM9jCTRheZAd4wBHuxcE4vSucIZBt2MzQEiopPKt3AzNmRN2o4S54LTvkumBjWLHZA8cIMkKwlUENb6Vd4cBnmiOmi1GXhJd1ZAEqWOZALxBlvzNwZD')
  page_access_token = @user.get_connections('me', 'accounts').first['access_token'] #this gets the users first page.
  @page = Koala::Facebook::API.new(page_access_token)


  Offer.where(:publicated => false).each do |offer|

    if offer.start_date <= DateTime.now
      puts("entre una vez")
      t = offer.name
      b = offer.description.first(50)+"..."

      options = {
          :message     => "#{t}",
          :description => "#{b}",
          :link        => "www.facebook.com.ar" #"http://localhost:3000/offers/#{(offer.id).to_s}"
#          :picture     => # "http://localhost:3000"+"#{offer.photo_url}"
      }
      post = @page.put_object('1474232979498488','feed', options)
      offer.publicated = true
      offer.save!
      end
    end
end