module Api
  module V1
    class WebsitesController < ApplicationController
      respond_to :json
      before_action :verify_requested_format!

      # GET /websites
      def index
        @websites = Website.all
        respond_with @websites
      end

      # POST /websites
      def create
        @website = Website.create(website_params)
        respond_with @website
      end

      private

      def website_params
        params.require(:website).permit(:url)
      end
    end
  end
end
