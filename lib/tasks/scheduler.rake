task daily_articles: :environment do
  rails c
  ::SpaceFlight::ArticleService.new.create_articles_on_db
  exit
end