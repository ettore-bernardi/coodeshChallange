class Api::V1::ArticlesControlle < ApplicationController

  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = @article
    render json: article
  end

  def create
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
    if article.update_attributes(product_params)
      render json: {status: 'SUCCESS', message: "Updated article", data:article},status: :ok
    else
      rendes json: {status: 'ERROR', message: 'Article not updated', data:article.error},status: :unprocessable_entity
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def product_params
    params.permit(:id, :featured, :title, :url: :ImageUrl, :newsSite, :summary, :publisehdAt)
  end

end