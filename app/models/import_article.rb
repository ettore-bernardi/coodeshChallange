require 'uri'
require 'net/http'

class ImportArticle < ApplicationRecord
  def initialize
    @url = URI('https://api.spaceflightnewsapi.net/v3/articles')
  end

  def create_articles_on_db
    response = Net::HTTP.get_response(@url)
    response.body.each do |article|
      puts article
    end
  end
end