class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  
  def index
    @articles = Article.limit(limit)
    render json: @articles, each_resializer: ArticleSerializer
  end

  def show
    if @article.present?
      render json: @article, serializer: ArticleSerializer
    else
      render json: { status: 'batata', message: "Article with id: #{params[:id]} does not exists" }, status: :unprocessable_entity
    end
  end

  def create
    article = Article.find_by(article_id: params[:article_id])
    if article.present?
      render json: { status: 'ERROR', message: "Article with id: #{params[:id]} already exists" }, status: :unprocessable_entity
    else
      @article = Article.new(article_params)
      if @article.save
        render json: { status: 'SUCCESS', message: 'Article saved' }, status: :ok
      else
        render json: { status: 'ERROR', message: 'Article not saved' }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @article.present?
      @article.destroy
      render json: { status: 'SUCCESS', message: 'Deleted article' }, status: :ok
    else
      render json: { status: 'ERROR', message: "Article with id: #{params[:id]} does not exists" }, status: :unprocessable_entity
    end
  end

  def update
    if @article.present?
      if @article.update_attributes(article_params)
        render json: { status: 'SUCCESS', message: 'Article updated' }, status: :ok
      else
        rendes json: { status: 'ERROR', message: 'Article not updated' }, status: :unprocessable_entity
      end
    else
      render json: { status: 'ERROR', message: "Article with id: #{params[:id]} does not exists" }, status: :unprocessable_entity
    end
  end

  private

  def limit
    if params[:limit] == 'all'
      nil
    else
      params.fetch(:limit,10).to_i
    end
  end

  def set_article
    @article = Article.find_by(article_id: params[:id])
  end

  def article_params
    params.require(:article).permit(:article_id, :featured, :title, :url, :imageUrl, :newsSite, :summary, :publishedAt,
                                    :updatedAt, launches_attributes: %i[id provider], events_attributes: %i[id provider])
  end
end
