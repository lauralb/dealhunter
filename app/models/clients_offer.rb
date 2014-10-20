class ClientsOffer < ActiveRecord::Base
  has_one :client
  has_one :offer

  attr_accessible :client_id, :offer_id, :participated, :position, :time, :correct_answers
end
