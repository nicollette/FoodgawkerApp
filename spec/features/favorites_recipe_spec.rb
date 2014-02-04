require 'spec_helper'

describe 'when logged in', :type => :feature, :js => true do
  before :each do
    FactoryGirl.create(:user)
    FactoryGirl.create(:recipe)
    visit('/')

    find('#sign-in-li').find('#sign-in').click
    find('#sign-in-form').find('#username-input').fill_in('Username', :with => 'guest1')
    find('#sign-in-form').find("#password-input").fill_in('Password', :with => 'password')
    find('#sign-in-footer').find('#sign-in-button').click
  end
  
  it "favorites recipe successfully" do
    find("#recipe-1").find("#favorite").click
    visit('/#favorites')
    expect(page).to have_content('So soft and fluffy')
  end
end