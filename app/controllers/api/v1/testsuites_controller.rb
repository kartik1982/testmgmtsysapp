module Api
  module V1
    class TestsuitesController < ApplicationController
      def show
        testsuite_name= params[:id]
        @testsuite = Testsuite.find_by(title: testsuite_name)
        render json: @testsuite, status: 200
      end
    end
  end
end
