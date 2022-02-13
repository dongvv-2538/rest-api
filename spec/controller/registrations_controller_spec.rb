require 'rails_helper'

describe RegistrationsController, type: :controller do 
    describe "#create" do 
        subject { post :create, params: params }
        
        context 'when invalid data provided' do 
            let(:params) do 
                {
                    :data => {
                        :attributes => {
                            :login => nil, 
                            :password => nil
                        }
                    }
                }
            end

            let(:posible_errors) do 
                [
                    {
                        :source => {:pointer => '/data/attributes/login'},
                        :detail => "can't be blank"
                    },
                    {
                        :source => {:pointer => '/data/attributes/password'},
                        :detail => "can't be blank"
                    }
                ]
            end

            it 'should not create a user' do 
                expect{subject}.not_to change{ User.count }
            end

            it 'should return unproccessable entity status code' do 
                subject 
                expect(response).to have_http_status(:unprocessable_entity)
            end

            it 'should return a proper json error' do 
                subject 
                expect(posible_errors).to include(
                    json[:errors].first
                )
            end
        end

        context 'when valid data provided' do 
            let(:params) do 
                {
                    :data => {
                        :attributes => {
                            :login => 'test-x', 
                            :password => 'password'
                        }
                    }
                }
            end

            
            it 'should return 201 status code' do 
                subject
                expect(response).to have_http_status(:created)
            end

            it 'should create new user' do 
                expect{ subject }.to change{ User.count }.by(1)
            end

            it 'should return user data in response' do 
                subject 
                expect(json_data[:attributes]).to include(
                    {
                        :login => 'test-x', 
                        :password => 'password'
                    }
                )
            end
        end
    end

end