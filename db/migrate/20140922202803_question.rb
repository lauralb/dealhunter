class Question < ActiveRecord::Migration

  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct_answer
      t.string :answer1
      t.string :answer2
      t.string :answer3

      t.timestamps
    end
  end
end
