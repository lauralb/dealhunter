class ImageQuestions < ActiveRecord::Base
  attr_accessible :url, :answer

  def initialize(attributes = {})
    @url = url
    @answer = answer
  end

end