module Api
  module V1
    # Tags controller
    class TagsController < Api::V1::ApiController
      before_action :doorkeeper_authorize!
      include TagParams

      def index
        render json: Tag.all
      end

      def show
        tag = Tag.find_by_id(params[:id])
        render json: tag
      end

      def create
        tag = Tag.find_or_create_by(create_params)
        render json: tag
      end
    end
  end
end
