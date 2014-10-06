class SecondGamesController < InheritedResources::Base
  def index

  end

  def show
    allquestions = ImageQuestion.all
    @questions = []
    previous_questions = []
    size = allquestions.size
    5.times do
      rand_position = rand(size -1)
      while previous_questions.include? rand_position
        rand_position = rand(size - 1)
      end
        previous_questions.append rand_position
        @questions.append(allquestions.at(rand_position))
    end

  end

  def start

  end

  def results
    @time = params[:time].to_i
    @score = params[:score].to_i
  end

end
