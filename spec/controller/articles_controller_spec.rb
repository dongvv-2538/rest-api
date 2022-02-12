require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe '#create' do
        subject { post :create }
    
        context 'when no code provided' do
          it_behaves_like 'forbidden_requests'
        end
    
        context 'when invalid code provided' do
          before { request.headers['authorization'] = 'Invalid token' }
          it_behaves_like 'forbidden_requests'
        end
    
        context 'when authorized' do
            let(:user) { create :user }
            let(:access_token) { create :access_token, user: user }
            before { request.headers['authorization'] = "Bearer #{access_token.token}" }
      
            context 'when invalid parameters provided' do
                let(:invalid_attributes) do
                    {
                    data: {
                        attributes: {
                        tittle: '',
                        content: ''
                        }
                    }
                    }
                end
        
                subject { post :create, params: invalid_attributes }
        
                it 'should return 422 status code' do
                    subject
                    expect(response).to have_http_status(:unprocessable_entity)
                end
        
                it 'should return proper error json' do
                    subject
                    expect(json[:errors]).to include(
                    {
                        :source => { :pointer => "/data/attributes/title" },
                        :detail =>  "can't be blank"
                    },
                    {
                        :source => { :pointer => "/data/attributes/content" },
                        :detail =>  "can't be blank"
                    },
                    {
                        :source => { :pointer => "/data/attributes/slug" },
                        :detail =>  "can't be blank"
                    }
                    )
                end
            end

            context 'when success request sent' do
               
        
                let(:valid_attributes) do
                  {
                    :data => {
                      :attributes => {
                        :title => 'Awesome article',
                        :content => 'Super content',
                        :slug => 'awesome-article'
                      }
                    }
                  }
                end
        
                subject { post :create, params: valid_attributes }
        
                it 'should have 201 status code' do
                  subject
                  expect(response).to have_http_status(:created)
                end
        
                it 'should have proper json body' do
                  subject
                  expect(json_data[:attributes]).to include(
                    valid_attributes[:data][:attributes]
                  )
                end
        
                it 'should create the article' do
                  expect{ subject }.to change{ Article.count }.by(1)
                end
            end
        end
    end
end