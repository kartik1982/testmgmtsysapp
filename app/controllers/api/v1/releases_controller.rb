module Api
  module V1
    class ReleasesController < ApiController
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
