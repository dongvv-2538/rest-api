require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should be positive number' do 
    expect(1).to be_positive
  end

  it 'should have valid factory' do 
    article = create :article
    expect(article.title).to eq('Sample Article')
  end
end
