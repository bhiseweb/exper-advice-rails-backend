module Api
  module V1
    # Posts controller
    class PostsController < Api::V1::ApiController
      before_action :doorkeeper_authorize!, only: %i[create update destroy]
      include PostParams

      def index
        posts = if params[:query].present?
                  Post.joins(:tags).where('tags.name LIKE ?', "%#{params[:query]}%")
                elsif params[:page]
                  Post.page(params[:page][:number]).per(params[:page][:size])
                else
                  Post.all
                end
        render json: posts
      end

      def show
        render json: Post.friendly.find(params[:id])
      end

      def create
        post = Post.new(post_params)
        if post.save
          tags = params[:data][:relationships][:tags][:data].map { |tag| tag['id'].to_i }
          tags.each do |id|
            PostTag.create(post_id: post.id, tag_id: id)
          end
          render json: post
        else
          render json: post.errors
        end
      end

      def update
        post = Post.friendly.find(params[:id])
        post.update_attributes(post_params)
        render json: post
      end

      def destroy
        post = Post.friendly.find(params[:id])
        post.destroy if post.user == current_user
        render json: nil
      end
    end
  end
end
