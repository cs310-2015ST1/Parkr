class SearchSuggestionsController < ApplicationController
  def index
    render json: SearchSuggestion.terms_for(params[:location])
  end
end
