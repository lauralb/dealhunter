class FirstGamesController < InheritedResources::Base

  def show
    allquestions = Question.all
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

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def question_mockups

  end

  def index

  end

  def results
    @time = params[:time].to_i
    @score = params[:score].to_i
    clientOffer = ClientsOffer.where(:client_id => current_user.id,:offer_id => current_user.client.current_offer).first
    clientOffer[:time] = Integer(params[:time])
    clientOffer[:correct_answers] = Integer(params[:score])
    clientOffer[:participated] = true
    clientOffer.save

  end

end