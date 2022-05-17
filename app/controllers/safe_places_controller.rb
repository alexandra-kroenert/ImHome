class SafePlacesController < ApplicationController
  before_action :set_safe_place, only: %i[show edit destroy update]

  def index
    @safe_places = SafePlace.all
    @user_safe_places = []
    @safe_places.each do |s|
      @user_safe_places << s if s.user == current_user
    end
    return @user_safe_places
  end

  def show
  end

  def new
    @safe_place = SafePlace.new
  end

  def create
    @safe_place = SafePlace.new(safe_place_params)
    @safe_place.user = current_user
    @safe_place.save!
    if @safe_place.save!
      redirect_to safe_places_path
    else
      render :new, notice: "Please check your safe place's details."
    end
  end

  def edit
  end

  def update
    if @safe_place.update(safe_place_params)
      redirect_to safe_places_path, notice: "Your safe place was successfully updated!"
    else
      render :edit, notice: "Please check your safe place's details"
    end
  end

  def destroy
    @safe_place.destroy
    redirect_to safe_places_path
  end

  private

  def set_safe_place
    @safe_place = SafePlace.find(params[:id])
  end

  def safe_place_params
    params.require(:safe_place).permit(:name, :address)
  end
end
