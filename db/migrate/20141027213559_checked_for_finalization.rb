class CheckedForFinalization < ActiveRecord::Migration
  def change
    add_column :offers, :finalization_checked, :boolean
  end
end
