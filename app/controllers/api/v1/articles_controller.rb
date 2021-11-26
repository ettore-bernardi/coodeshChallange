class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy] 
  def index
    articles = Article.all
     render json: articles.to_json(:include => [:launches, :events], :except =>[:id])
  end

  def show
    render :json => @article.to_json(:include => [:launches, :events])
  end

  def create
    byebug
    @article = Article.new(article_params)
    if @article.save
      render json: {status: 'SUCCESS', message: "Saved article", data:@article},status: :ok
    else
      rendes json: {status: 'ERROR', message: 'Article not saved', data:@article.error},status: :unprocessable_entity
    end
  end

  def destroy
    article = @article
    article.destroy
    render json: {status:'SUCCESS', message: 'Deleted article'}, data:article, status: :ok
  end

  def update
    article = @article
    if article.update_attributes(article_params)
      render json: {status: 'SUCCESS', message: "Updated article", data:article},status: :ok
    else
      rendes json: {status: 'ERROR', message: 'Article not updated', data:article.error},status: :unprocessable_entity
    end
  end

  private
  def set_article
    @article = Article.find_by(article_id: params[:id])
  end

  def article_params
    params.require(:article).permit(:article_id, :featured, :title, :url, :imageUrl, :newsSite, :summary, :publishedAt, :updatedAt, launches_attributes: [:id, :provider], events_attributes: [:id, :provider])
  end

end