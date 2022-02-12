require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "#test" do
    it 'should be positive number' do 
      expect(1).to be_positive
    end

    it 'should have valid factory' do 
      article = create :article
      expect(article.title).to eq('Sample Article')
    end
  end

  describe "#validations" do 
    it 'should not have blank title' do 
      article = build(:article, title: '')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'should not have blank content' do 
      article = build(:article, content: '')
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'should not have blank slug' do 
      article = build(:article, slug: '')
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'should have unique slug' do 
      article = create(:article)
      other_article = build(:article, slug: article.slug)
      expect(other_article).not_to be_valid
      expect(other_article.errors[:slug]).to include("has already been taken")
    end
  end
end
