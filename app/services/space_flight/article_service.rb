require 'uri'
require 'net/http'

module SpaceFlight
  class ArticleService
    def create_articles_on_db
      quantity_reponse = Net::HTTP.get_response(URI('https://api.spaceflightnewsapi.net/v3/articles/count'))
      quantity = quantity_reponse.body
      url = URI("https://api.spaceflightnewsapi.net/v3/articles?_limit=#{quantity}")

      response = Net::HTTP.get_response(url)
      @articles = JSON.parse(response.body)
      @articles.each do |article|
        @article_field = Article.find_by(article_id: article['id'])
        if @article_field.present?
          :null
        else
          @article_field = Article.new(
            article_id: article['id'],
            featured: article['featured'],
            title: article['title'],
            url: article['url'],
            imageUrl: article['imageUrl'],
            newsSite: article['newsSite'],
            summary: article['summary'],
            publishedAt: article['publishedAt']
          )
          @article_field.save
          article['launches'].each do |launch|
            @launch_field = Launch.new(
              launch_id: launch['id'],
              provider: launch['provider'],
              article_id: Article.last.id
            )
            @launch_field.save
          end
          article['events'].each do |event|
            @event_field = Event.new(
              event_id: event['id'],
              provider: event['provider'],
              article_id: Article.last.id
            )
            @event_field.save
          end
        end
      end
    end

    def create_daily_articles
      url = URI('https://api.spaceflightnewsapi.net/v3/articles')
      response = Net::HTTP.get_response(url)
      @articles = JSON.parse(response.body)
      @articles.each do |article|
        @article_field = Article.find_by(article_id: article['id'])
        if @article_field.present?
          :null
        else
          @article_field = Article.new(
            article_id: article['id'],
            featured: article['featured'],
            title: article['title'],
            url: article['url'],
            imageUrl: article['imageUrl'],
            newsSite: article['newsSite'],
            summary: article['summary'],
            publishedAt: article['publishedAt']
          )
          @article_field.save
          article['launches'].each do |launch|
            @launch_field = Launch.new(
              launch_id: launch['id'],
              provider: launch['provider'],
              article_id: Article.last.id
            )
            @launch_field.save
          end
          article['events'].each do |event|
            @event_field = Event.new(
              event_id: event['id'],
              provider: event['provider'],
              article_id: Article.last.id
            )
            @event_field.save
          end
        end
      end
    end
  end
end
