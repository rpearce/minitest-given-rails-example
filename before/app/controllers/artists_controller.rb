class ArtistsController < ApplicationController
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html
      format.json { render json: @artists }
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      format.html do
        if @artist.save
          redirect_to @artist
        else
          render :new
        end
      end

      format.json do
        if @artist.save
          render json: @artist, status: :created
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def show
    @artist = get_artist

    respond_to do |format|
      format.html
      format.json { render json: @artist }
    end
  end

  def edit
    @artist = get_artist
  end

  def update
    @artist = get_artist

    respond_to do |format|
      format.html do
        if @artist.update_attributes(artist_params)
          redirect_to @artist
        else
          render :edit
        end
      end

      format.json do
        if @artist.update_attributes(artist_params)
          render json: @artist, status: :ok
        else
          render json: @artist.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @artist = get_artist

    respond_to do |format|
      format.html do
        @artist.destroy
        redirect_to :artists
      end

      format.json do
        @artist.destroy
        head :no_content
      end
    end
  end

  private

  def get_artist
    Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
