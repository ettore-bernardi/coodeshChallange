task daily_articles: :environment do
  ::SpaceFlight::ArticleService.new.create_articles_on_db
end