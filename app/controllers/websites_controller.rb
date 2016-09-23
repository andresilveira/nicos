class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :destroy]

  # GET /websites
  def index
    @websites = Website.all
    @website = Website.new
  end

  # GET /websites/1
  def show
  end

  # POST /websites
  def create
    @website = Website.new(website_params)

    if @website.save
      redirect_to @website, notice: 'Website was successfully created.'
    else
      render :index
    end
  end

  # DELETE /websites/1
  def destroy
    @website.destroy
    redirect_to websites_url, notice: 'Website was successfully destroyed.'
  end

  private

  def set_website
    @website = Website.find(params[:id])
  end

  def website_params
    params.require(:website).permit(:url)
  end
end
