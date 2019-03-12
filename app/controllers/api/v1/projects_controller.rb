module Api
  module V1
    class ProjectsController < ApplicationController
      def show
        project_name= params[:id]
        @project = Project.find_by(title: project_name)
        render json: @project, status: 200
      end
    end
  end
end
