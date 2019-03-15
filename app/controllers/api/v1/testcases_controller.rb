module Api
  module V1
    class TestcasesController < ApplicationController
      skip_before_action :require_user, only: [:show, :index]
      def show
        @testcase = Testcase.find(params[:id])
        render json: @testcase, status: 200
      end
      def index
        testcase_name= params[:title]
        @testcase = Testcase.find_by(title: testcase_name)
        render json: @testcase, status: 200
      end
    end
  end
end
