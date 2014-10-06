class AddedImageQuestionForGames < ActiveRecord::Migration
  def up
    create_table :image_questions do |t|
      t.column(:url, :string)
      t.column(:question, :string)
      t.column(:answer, :string)
    end
  end

  def down
  end

end
