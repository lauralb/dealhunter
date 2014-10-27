class RemoveTimeFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :updated_at
    remove_column :questions, :created_at
  end
end
