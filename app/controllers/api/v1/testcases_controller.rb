module Api
  module V1
    class TestcasesController < ApplicationController
      def show
        testcase_name= params[:id]
        @testcase = Testcase.find_by(title: testcase_name)
        render json: @testcase, status: 200
      end
    end
  end
end
