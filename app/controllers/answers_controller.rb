class AnswersController < ApplicationController
  def show
    # @question = Question.where(id: params[:id])
    # @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create

    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question



    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render 'questions/show', status: :created, location: @question }
      else
        format.html { render 'questions/show' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def find_question_id
    params.require()

  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
