class ArticleSerializer < ApplicationSerializer
  attributes :article_id, :featured, :title, :url, :imageUrl, :newsSite, :summary, :publishedAt
  has_many :launches
  has_many :events
end