class Api::PostsController < ApplicationController
  before_action :check_tags, :check_sortBy, :check_direction, only: :index
  def index
    responses = PostsServicer.new.generate_responses(params[:tags])
    render json: PostsSerializer.posts(responses, params[:sortBy], params[:direction]), status: :ok
  end

  private

  def check_tags
    render json: { error: 'Tags parameter is required' }, status: :bad_request if params[:tags].nil?
  end

  def check_sortBy
    attributes = %w[authorId likes popularity reads id]
    if params[:sortBy].present? && !attributes.include?(params[:sortBy])
      render json: { error: 'sortBy parameter is invalid' },
             status: :bad_request
    end
  end

  def check_direction
    attributes = %w[desc asc]
    if params[:direction].present? && !attributes.include?(params[:direction])
      render json: { error: 'Direction parameter is invalid' },
             status: :bad_request
    end
  end
end
