module Api
  module V1
    class TestsuitesController < ApiController
      def show
        @testsuite = Testsuite.find(params[:id])
        render json: @testsuite, status: 200
      end
      def index
        testsuite_name= params[:title]
        @testsuite = Testsuite.find_by(title: testsuite_name)
        render json: @testsuite, status: 200
      end
    end
  end
end
