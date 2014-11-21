class Offer < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  has_many :clients_offers
  has_many :prizes
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :titles
  belongs_to :branch

  attr_accessible :gmaps, :name, :photo, :branch_id, :prizes_attributes, :description, :titles, :publication_date, :publicated, :is_first_game
  attr_accessible :start_date, :end_date
  attr_accessor :current_weight

  accepts_nested_attributes_for :prizes, :allow_destroy => true

  mount_uploader :photo, PhotoUploader

  validates_presence_of :name, :start_date, :end_date, :publication_date, :branch, :branch_id
  validate :time_coherence, :has_prizes

  scope :ended, Offer.where('end_date < ?', Date.today)
  scope :actual, Offer.where('end_date >= ?', Date.today)

  acts_as_gmappable

  def has_prizes
    errors.add(:base, 'must add at least one prize') if self. prizes.blank?
    self.prizes.each do |p|
      errors.add(:base, "Valores erroneos en los premios") if p.real_price <= 0 || p.discount_percentage <= 0
    end
  end

  def get_current_weight
    if current_weight.nil? then return 0  end
    current_weight
  end

  def has_title(search_title)
    has = false
    self.titles.each do |t|
      if t.name == search_title
        has = true
      end
    end
    return has

  end

  def prefer(preference)
    prefer = false
    self.titles.each do |p|
      if preference.name == p.name
        prefer = true
      end
    end
    return prefer
  end

  def time_coherence
    errors.add(:start_date, "No puede ser posterior a la fecha de fin") if self.start_date > self.end_date unless (start_date.nil? or end_date.nil?)
    errors.add(:publication_date, "No puede ser posterior a la fecha de fin") if self.publication_date > self.end_date.to_date unless (publication_date.nil? or end_date.nil?)
    errors.add(:publication_date, "No puede ser anterior a la fecha de inicio") if self.publication_date < self.start_date.to_date unless (publication_date.nil? or start_date.nil?)

    errors.add(:end_date, "No puede ser anterior a la fecha de hoy") if self.end_date < Date.today() unless end_date.nil?


  end

  def company
    self.branch.company unless self.branch.nil?
  end

  def gmaps
    self.branch.address.gmaps
  end

  def gmaps4rails_address
    "#{self.branch.address.street} #{self.branch.address.number}, #{self.branch.address.city}"
    #"#{self.street} #{self.number}, #{self.city}, #{self.country.name}"
  end


  def gmaps4rails_infowindow
    "<a href='#{offer_path(self)}'><h4>#{self.name}</h4></a>"
  end


  def latitude
    self.branch.address.latitude
  end

  def longitude
    self.branch.address.longitude
  end

  def weight(id) #recibe el id del cliente en cuestion
    sum = 0
    Client.find(id).preferences.each do |pref|
      self.titles.all.each do |title|
        if title == Title.find(pref.title_id)
          sum = sum + pref.weight.to_i
        end
      end
    end
    company_weight = ClientsCompany.where(:client_id => id, :company_id => self.company.id).select("weight").first
    if !company_weight.nil?
     self.current_weight = sum + company_weight.weight
    end
    return sum
  end

  def finished?
    self.end_date < Date.today
  end


  def self.get_newly_finalized_offers
    offers = []
    Offer.all.each do |offer|
      if(offer.end_date != nil)
        unless offer.finalization_checked?
          if offer.finished?
            offers.push(offer)
          end
        end
      end
    end
    return offers
    end


  def self.get_other_offers
    offers = []
    Offer.all.each do|offer|
      unless offer.finalization_checked?
        unless offer.finished?
          offers.push(offer)
        end
      end
    end
  return offers
  end


  def assign_positions
    c_os = ClientsOffer.find_all_by_offer_id(self.id)

   if c_os.length == 1
      c_os.first.position=1
      c_os.first.save!
    else
      c_os.sort!{|a, b| a.time <=> b.time}
      c_os.sort!{|a,b| a.correct_answers <=> b.correct_answers}
      c_os.each_with_index do |c_o, i|
        c_o.position = i+1
        c_o.save!
      end
    end
  end

end

