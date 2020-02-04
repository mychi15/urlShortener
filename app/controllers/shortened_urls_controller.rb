class ShortenedUrlsController < ApplicationController
  before_action :set_shortened_url, only: [:show, :edit, :update, :destroy]

  # GET /shortened_urls
  def index
    @shortened_urls = ShortenedUrl.all
  end

  # GET /shortened_urls/1
  def show
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
    @shortened_urls = ShortenedUrl.all
  end

  # POST /shortened_urls
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    @shortened_url.short_url = ShortenedUrl.create_short_url(shortened_url_params)

    if @shortened_url.save
      redirect_to @shortened_url, notice: 'Shortened url was successfully created.'
    else
      render :new
    end
  end

  # DELETE /shortened_urls/1
  def destroy
    @shortened_url.destroy
    redirect_to new_shortened_url_url, notice: 'Shortened url was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortened_url
      @shortened_url = ShortenedUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortened_url_params
      params.require(:shortened_url).permit(:long_url, :short_url)
    end
end
