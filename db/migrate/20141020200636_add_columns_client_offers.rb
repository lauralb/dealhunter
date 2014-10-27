class AddColumnsClientOffers < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_column :clients_offers, :time, :integer
    add_column :clients_offers, :correct_answers, :integer
  end
end
