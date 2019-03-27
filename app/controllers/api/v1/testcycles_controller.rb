module Api
  module V1
    class TestcyclesController < ApiController
      def show
        @testcycle = Testcycle.find(params[:id])
        render json: @testcycle, status: 200
      end
      def index
        testcycle_name= params[:title]
        @testcycle = Testcycle.find_by(title: testcycle_name)
        render json: @testcycle, status: 200
      end
    end
  end
end
