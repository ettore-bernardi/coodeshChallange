require 'rails_helper'

describe 'Articles API', type: :request do
  describe 'GET /articles' do
    it 'return all articles' do
      FactoryBot.create(:article, id: '1', featured: false, title: 'A normal title')
      FactoryBot.create(:article, id: '2', featured: true, title: 'Some fancy title')
      
      get '/api/v1/articles'
  
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
  
  describe 'POST /articles' do
    it 'create a new article' do
      expect{
        post '/api/v1/articles', params: { article: {
          id: '1',
          featured: true,
          title:'SpaceX Launch'
        }}
    }.to change { Article.count }.from(0).to(1)

      expect(response).to have_http_status(:success)  
    end
  end

  describe 'DELETE /articles/:id' do
    it 'delete a article' do
      article = FactoryBot.create(:article, article_id: '1', featured: false, title: 'A normal title')
      
      expect{
        delete "/api/v1/articles/#{article.article_id}"
      }.to change {Article.count}.from(1).to(0)

      expect(response).to have_http_status(:success)  
    end
  end
  
end