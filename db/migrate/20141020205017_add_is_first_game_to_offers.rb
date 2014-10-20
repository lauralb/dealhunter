class AddIsFirstGameToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :is_first_game, :boolean
  end
end
