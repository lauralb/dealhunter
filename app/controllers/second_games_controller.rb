class SecondGamesController < InheritedResources::Base
  def index
    current_user.client.current_offer = params[:offer_id] unless params[:offer_id].nil?
    current_user.client.save
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
    1+1
    clientOffer = ClientsOffer.where(:client_id => current_user.id,:offer_id => current_user.client.current_offer).first
    clientOffer[:time] = Integer(params[:time])
    clientOffer[:correct_answers] = Integer(params[:score])
    clientOffer[:participated] = true
    clientOffer.save

  end

end
