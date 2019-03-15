module Api
  module V1
    class TestcyclesController < ApplicationController
      skip_before_action :require_user, only: [:show, :index]
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
