require 'spec_helper'

describe 'logging in', :type => :feature, :js => true do
  it 'logs in successfully' do
    visit('/')

    find('#sign-in-li').find('#sign-in').click
    find('#sign-in-form').find('#username-input').fill_in('Username', :with => 'hungryhippo')
    find('#sign-in-form').find("#password-input").fill_in('Password', :with => 'password')
    find('#sign-in-footer').find('#sign-in-button').click
    
    expect(page).to have_content('Welcome')
  end
end