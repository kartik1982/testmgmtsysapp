module Api
  module V1
    class ReportsController < ApiController
      skip_before_action :verify_authenticity_token, only: [:create]

      def show
          render json: Report.find(params[:id])
      end
      def index
        @reports = Report.all
        render json: @reports, adapter: :json
      end
      def create
        @report = Report.new(report_params)
        if @report.save
          render json: @report, adapter: :json, status: 201
        else
          render json: {error: @report.errors }, status: 422
        end
      end
      def report_params
        params.require(:report).permit(:release_id, :project_id, :testcycle_id, :testsuite_id, :testcase_id, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build)
      end
    end
  end
end
