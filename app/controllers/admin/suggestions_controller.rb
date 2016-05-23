class Admin::SuggestionsController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @suggestions = Suggestion.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
  end
end
