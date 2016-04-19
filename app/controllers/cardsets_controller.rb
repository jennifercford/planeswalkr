class CardsetsController < ApplicationController
  before_action :administrate!, except: [:show]

  def new
    render :new
  end

  def create
    file = params[:cardset]
    begin
      data = JSON.parse(file.read)
    rescue JSON::ParserError => e
      flash[:notice] = "That JSON file is all fucked up."
      redirect_to root_path
    end
    ActiveRecord::Base.transaction do
      @set = CardSet.new(name: data["name"],
                         set_type: data["type"],
                         code: data["code"],
                         release_date: DateTime.parse(data["releaseDate"]),
                         block: data["block"])
      @cards = data["cards"].map do |card|
        Card.import_from_json(card)
      end
      @set.cards = @cards
      @set.save
    end
    flash[:notice] = "New Set Import #{@set.name} was successful." if @set.persisted?
    redirect_to root_path
  end

  def show
    @cardset = CardSet.find_by!(code: params[:id])
    render :show
  end

  def index
    @cardsets = CardSet.all
    render :index
  end
end
