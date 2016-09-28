module Api
  module V1
    class WebsitesController < ApplicationController
      respond_to :json
      before_action :verify_requested_format!

      # NOTE: we are skipping this only in order to be able to play with the
      # api via console (e.g. cUrl). As soon as we have any kind of authentication
      # we should remove this line
      skip_before_action :verify_authenticity_token

      # GET /websites
      def index
        @websites = Website.all
        respond_with @websites
      end

      # POST /websites
      def create
        @website = WebsiteScraper.new(Website.new(website_params)).go_get_it
        @website.save
        respond_with @website
      end

      private

      def website_params
        params.require(:website).permit(:url)
      end
    end
  end
end
