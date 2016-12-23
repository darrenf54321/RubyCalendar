require 'spec_helper'
require 'rails_helper'

feature 'calendar events' do

    scenario 'must be logged in to use application' do
      visit '/calendar_events/new'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
end
