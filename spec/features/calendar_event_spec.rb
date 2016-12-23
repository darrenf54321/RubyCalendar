require 'spec_helper'
require 'rails_helper'

feature 'log calendar events' do

  scenario 'as a user I want to be able to create an event' do
    sign_up
    expect(page).to have_content "Calendar Events"
    click_link "Calendar Events"
    click_link 'Create New Calendar Event'
    expect(page).to have_content ('Details')
    click_button 'Create Event'
    expect(page).to have_content ('You successfully created a calendar event')
  end

  # scenario 'as a user I want to be able to edit an event' do
  #   sign_up
  #   expect(page).to have_content "Calendar Events"
  #   click_link "Calendar Events"
  #   click_link 'Create New Calendar Event'
  #   click_button 'Create Event'
  #   click_link 'Home'
  #   click_link "Calendar Events"
  #   click_link 'All Calendar Events'
  #   click_button 'Edit'
  #   expect(page).to have_content ('Details')
  #   click_button 'Create Event'
  #   # expect(page).to have_content ('Calendar event was successfully updated.')
  # end


  scenario 'as a user I want to be able to delete an event' do
    sign_up
    expect(page).to have_content "Calendar Events"
    click_link "Calendar Events"
    click_link 'Create New Calendar Event'
    expect(page).to have_content ('Details')
    click_button 'Create Event'
    expect(page).to have_content ('You successfully created a calendar event')
    click_link "Calendar Events"
    click_link 'All Calendar Events'
    click_link 'Destroy'
    accept_confirm 'OK'
    expect(page).to have_content ('Calendar event was successfully destroyed.')
  end

  scenario 'as a user I want to be able to show an event' do
    sign_up
    expect(page).to have_content "Calendar Events"
    click_link "Calendar Events"
    click_link 'Create New Calendar Event'
    expect(page).to have_content ('Details')
    click_button 'Create Event'
    expect(page).to have_content ('You successfully created a calendar event')
    click_link "Calendar Events"
    click_link 'All Calendar Events'
    click_link 'Show'
    expect(page).to have_content ('Calendar Event Details')
  end
end
