require 'spec_helper'

describe 'submitting a new recipe', :type => :feature, :js => true do
  before :each do
    FactoryGirl.create(:user)
  end
  
  it "submits form successfully" do
    visit('/')

    find('#sign-in-li').find('#sign-in').click
    find('#sign-in-form').find('#username-input').fill_in('Username', :with => 'guest1')
    find('#sign-in-form').find("#password-input").fill_in('Password', :with => 'password')
    find('#sign-in-footer').find('#sign-in-button').click
    
    expect(page).to have_content('Welcome')
    
    find("#submit-recipe-li").find("#submit-recipe").click
    
    fill_in('title', :with => "best cookies everrrr")
    fill_in('blog_url', :with => "www.fakinit.com")
    fill_in('description', :with => "nOMMMM")
    click_button("Add Recipe")
    expect(page).to have_content('nOMMMM')
  end
end