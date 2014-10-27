class AddMailedColumn < ActiveRecord::Migration
  def change
    add_column :clients_offers, :mailed, :boolean
  end
end