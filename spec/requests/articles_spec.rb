require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "#index" do
    it "returns http success" do
      get "/articles/index"
      expect(response).to have_http_status(:success)
    end

    it "should return list of article in proper json body" do 
      article = create :article

      get '/articles'

      expect(json_data.length).to eq(1)
      expected = json_data.first 

      aggregate_failures do 
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )
      end
    end

    context "pagination" do 

      subject { get '/articles', params: { page: { number: 2, size: 1 } } }

      it 'paginate results' do 
        article_1, article_2, article_3 = create_list(:article, 3)
        subject
        expect(json_data.length).to eq(1)
        expect(json_data.first[:id]).to eq(article_2.id.to_s)
      end

      it 'contains pagination links in the response' do 
        article_1, article_2, article_3 = create_list(:article, 3)
        subject
        expect(json[:links].length).to eq(5)
        expect(json[:links].keys).to contain_exactly(
          :first, :prev, :next, :last, :self
        )
      end
    end
    
  end

  describe "#show" do
    let(:article) {create :article}

    subject { get "/articles/#{article.id}"}

    before { subject }


    it 'returns a success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should returns a proper JSON' do 
      aggregate_failures do 
        expect(json_data[:id]).to eq(article.id.to_s)
        expect(json_data[:type]).to eq('article')
        expect(json_data[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )
      end
    end
  end

  describe '#create' do
    subject { post :create }

    context 'when no code provided' do
      it_behaves_like 'forbidden_requests'
    end

    context 'when invalid code provided' do
      before { request.headers['authorization'] = 'Invalid token' }
      it_behaves_like 'forbidden_requests'
    end

    context 'when invalid parameters provided' do

    end
  end
end
