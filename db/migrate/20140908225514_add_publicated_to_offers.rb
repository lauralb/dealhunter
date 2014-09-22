class AddPublicatedToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :publicated, :boolean
  end
end
