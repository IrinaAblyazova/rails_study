class Api::V1::ArticlesController < Api::V1::ApplicationController
  def index
    articles = Article.order(title: :asc).decorate
    render json: articles, each_serializer: ArticleIndexSerializer
  end

  def show
    article = Article.active.find(params[:id])
    render json: article, serializer: ArticleShowSerializer
  end
end
