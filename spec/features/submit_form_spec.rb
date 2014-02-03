require 'spec_helper'

describe 'submitting a new recipe', :type => :feature, :js => true do
  before :each do

  end
  
  it "submits form successfully" do
    visit('/')
    click_button("Guest Log In")
    sleep(30)
    
    click_link("#submit-recipe")
    fill_in('title', :with => "best cookies everrrr")
    fill_in('blog_url', :with => "www.fakinit.com")
    click_button("Add Recipe")
    
    expect(page).to have_content('best cookies everrrr')
  end
end