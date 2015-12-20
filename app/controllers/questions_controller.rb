class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    # @question = Question.where(id: params[:id])
    @user_id = current_user.id
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    if current_user.nil?
      redirect_to '/', notice: 'Please login to post a question'
    else
      @question = Question.new
      @user_id = current_user.id
    end
  end

  def create
    binding.pry
    @user_id =  current_user.id
    @question = Question.new(name: params[:name], description: params[:description], user_id: current_user.id)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully edited.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    @question.answers.destroy_all
    redirect_to '/'
  end

  private
  def question_params
    params.require(:question).permit(:name, :description, )
  end
end
