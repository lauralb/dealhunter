class SecondGameQuestions < ActiveRecord::Migration
  def up
    create_table :image_questions do|t|
      t.string :answer
      t.string :url
    end
  end

  def down
    drop_table :image_question
    raise ActiveRecord::IrreversibleMigration
  end
end
