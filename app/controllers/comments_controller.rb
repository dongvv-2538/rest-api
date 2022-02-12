class CommentsController < ApplicationController
  skip_before_action  :authorize!, only: [:index]
  # GET /comments
  def index
    comments = article.comments.
      page(params[:page]).
      per(params[:per_page])
    render json: serializer.new(comments), status: :ok
  end



  # POST /comments
  def create
    @comment = article.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      render json: @comment, status: :created, location: article
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end

    def article 
      @article = Article.find(params[:article_id])
    end

    def serializer 
      CommentSerializer
    end
end
