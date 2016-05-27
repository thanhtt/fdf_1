class Admin::SuggestionsController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @suggestions = Suggestion.page params[:page]
  end

  def show
  end
end
