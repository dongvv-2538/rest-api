require 'rails_helper'

describe 'registration routes' do 
    it 'should route to registrations#create' do 
        expect(post '/signup').to route_to("registration#create")
    end
end