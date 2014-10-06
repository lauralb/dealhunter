class SecondGamesController < InheritedResources::Base
  def index

  end

  def result

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

  def submit
    time = params[:time]
  end

end
