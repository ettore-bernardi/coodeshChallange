task daily_articles: :environment do
  run rails console
  ::SpaceFlight::ArticleService.new.create_articles_on_db
  exit
end