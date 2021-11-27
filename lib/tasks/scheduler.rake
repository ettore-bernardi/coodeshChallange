task daily_articles: :environment do
  ::SpaceFlight::ArticleService.new.create_daily_articles
end