require 'spec_helper'

Capybara.default_wait_time = 60

describe 'submitting a new recipe', :type => :feature, :js => true do
  before :each do
    visit('/')
    click_button("Guest Log In")
  end
  
  it "submits form successfully" do
    
    
    click_link("Submit Recipe")
    fill_in('title', :with => "best cookies everrrr")
    fill_in('blog_url', :with => "www.fakinit.com")
    click_button("Add Recipe")
    
    expect(page).to have_content('best cookies everrrr')
  end
end