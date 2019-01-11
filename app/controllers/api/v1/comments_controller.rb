module Api
  module V1
    # Comments controller
    class CommentsController < Api::V1::ApiController
      before_action :doorkeeper_authorize!, only: :create
      include CommentParams

      def index
        posts = Comment.all
        render json: posts
      end

      def show
        render json: Comment.find_by_id(params[:id])
      end

      def create
        comment = Comment.new(create_params)
        comment.save
        render json: comment
      end
    end
  end
end
