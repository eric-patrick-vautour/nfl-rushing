class NflRushingsController < ApplicationController
  def index
    @search = NflRushing.search(params[:q])
    @nfl_rushings = @search.result
    
    respond_to do |format|
      format.html
      format.csv { render text: NflRushing.to_csv(@nfl_rushings) }
    end
  end
end