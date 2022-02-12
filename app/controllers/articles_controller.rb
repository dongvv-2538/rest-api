class ArticlesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]

  include Paginable

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    article = Article.find_by(id: params[:id])
    render json: serializer.new(article), status: :ok
  end

  def create
    article = Article.new(article_params)
    article.save!
    render json: serializer.new(article), status: :created
  rescue
    render json: article, adapter: :json_api,
      serializer: ActiveModel::Serializer::ErrorSerializer,
      status: :unprocessable_entity
  end

  private 

  def serializer
    ArticleSerializer
  end

  def article_params
    params.require(:data).require(:attributes).permit(:title, :content, :slug) || ActionController::Parameters.new
  end
end
