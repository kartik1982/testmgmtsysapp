module Api
  module V1
    class ProjectsController < ApplicationController
      skip_before_action :require_user, only: [:show, :index]
      def show
        @project = Project.find(params[:id])
        render json: @project, status: 200
      end
      def index
        project_name= params[:title]
        @project = Project.find_by(title: project_name)
        render json: @project, status: 200
      end
    end
  end
end
