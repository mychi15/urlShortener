class ShortenedUrlsController < ApplicationController
  # GET /shortened_urls/1
  def show
    @shortened_url = ShortenedUrl.find(params[:id])
  end

  # GET /shortened_urls/new
  def new
    @shortened_url = ShortenedUrl.new
    @shortened_urls = ShortenedUrl.page(params[:id])
  end

  # POST /shortened_urls
  def create
    @shortened_url = ShortenedUrl.new(shortened_url_params)
    @shortened_url.token = ShortenedUrl.generate_token

    if @shortened_url.save
      redirect_to @shortened_url, notice: 'Shortened url was successfully created.'
    else
      render :new
    end
  end

  # DELETE /shortened_urls/1
  def destroy
    @shortened_url = ShortenedUrl.find(params[:id])
    @shortened_url.destroy
    redirect_to new_shortened_url_url, notice: 'Shortened url was successfully destroyed.'
  end

  def go_to_long_url
    @shortened_url = ShortenedUrl.find_by(token: params[:token])
    redirect_to @shortened_url.long_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shortened_url_params
      params.require(:shortened_url).permit(:long_url)
    end
end
