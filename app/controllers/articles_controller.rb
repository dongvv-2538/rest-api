class ArticlesController < ApplicationController

  include Paginable

  def index
    paginated = paginate(Article.recent)
    render_collection(paginated)
  end

  def show
    article = Article.find_by(id: params[:id])
    render json: serializer.new(article), status: :ok
  end

  private 

  def serializer
    ArticleSerializer
  end
end
