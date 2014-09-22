class FirstGamesController < InheritedResources::Base
  def show
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def question_mockups

  end
end