class AddCurrentOfferClient < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    add_column :clients, :current_offer, :integer
  end
end
