require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Attending Events', type: :feature do
  scenario 'User can assign themselves to an event' do
    sign_up
    click_link "Add your Event"
    create_event
    click_link "Log Out"
    sign_up_2
    click_link "View Event"
    click_button "I'm Going"
    expect(page).to have_content("1 going")
    expect(page).to have_content("5 places left")
  end

  scenario 'User can see FULL HOUSE message if an event is full' do
    sign_up
    click_link "Add your Event"
    create_event_2
    click_link "Log Out"
    sign_up_2
    click_link "View Event"
    click_button "I'm Going"
    expect(page).to have_content("FULL HOUSE! Find another event to attend here.")
  end
end
