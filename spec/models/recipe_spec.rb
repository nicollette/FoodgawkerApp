require 'spec_helper'

describe Recipe do
  describe "validations" do
    it "validates presence of title" do
      expect(FactoryGirl.build(:recipe, :title => "")).not_to be_valid
    end
  
    it "validates presence of blog url" do
      expect(FactoryGirl.build(:recipe, :blog_url => "")).not_to be_valid
    end
  
    it "validates presence of user id" do
      expect(FactoryGirl.build(:recipe, :user_id => nil)).not_to be_valid
    end
  end
  
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:recipe_categories) }
    it { should have_many(:categories) }
    it { should have_many(:favorites) }
  end  
end