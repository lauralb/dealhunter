class AddPublicationDateToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :publication_date, :date
  end
end
