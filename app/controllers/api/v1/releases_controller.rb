module Api
  module V1
    class ReleasesController < ApplicationController
      skip_before_action :require_user, only: [:show, :index]
      def show
        @release = Release.find(params[:id])
        render json: @release, status: 200
      end
      def index
        release_version= params[:title]
        @release = Release.find_by(title: release_version)
        render json: @release, status: 200
      end
    end
  end
end
