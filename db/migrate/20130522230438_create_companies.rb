class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.string :cuit

      t.timestamps
    end
  end
end
