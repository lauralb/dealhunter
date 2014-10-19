class Question < ActiveRecord::Base


  attr_accessible :question, :correct_answer, :answer1, :answer2, :answer3

  validates_presence_of :question, :correct_answer, :answer1, :answer2, :answer3

end