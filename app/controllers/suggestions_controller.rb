class SuggestionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @suggestion = Suggestion.new
  end

  def edit
  end

  def create
    @suggestion = current_user.suggestions.build suggestion_params
    if @suggestion.save
      flash[:success] = t "suggestions.suggestion_created"
      redirect_to root_url
    else
      flash[:danger] = t "suggestions.suggestion_error"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def suggestion_params
    params.require(:suggestion).permit :content
  end
end
