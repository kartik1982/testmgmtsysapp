module Api
  module V1
    class ReleasesController < ApplicationController
      def show
        release_version= params[:id]
        @release = Release.find_by(title: release_version)
        render json: @release, status: 200
      end
    end
  end
end
