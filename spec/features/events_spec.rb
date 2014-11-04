require 'rails_helper'

feature "Events" do

  scenario "User creates an event" do
    visit root_path
    expect(page).to have_no_content("Just a test event")
    click_on "New Event"
    fill_in "Description", with: "Just a test event"
    fill_in "Location", with: "Here"
    fill_in "Date", with: "11/15/2014"
    fill_in "Capacity", with: 50
    check "Requires ID"
    click_on "Create Event"
    expect(page).to have_content("Just a test event")
  end

  scenario "User views an event" do
    visit root_path
    expect(page).to have_no_content("Just a test event")
    click_on "New Event"
    fill_in "Description", with: "Just a test event"
    fill_in "Location", with: "Here"
    fill_in "Date", with: "11/15/2014"
    fill_in "Capacity", with: 50
    check "Requires ID"
    click_on "Create Event"
    expect(page).to have_content("Just a test event")
    click_on "Just a test event"
    expect(page).to have_content(50)
  end

  scenario "User edits an event" do
    Event.create!(
      description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "edit"
    fill_in "Description", with: "My awesome event"
    click_on "Update Event"

    expect(page).to have_content("My awesome event")
    expect(page).to have_no_content("My aweeesome event")
  end

  scenario "User deletes an event" do
    Event.create!(
      description: "Dumb event",
      capacity: 45
    )

    visit root_path
    expect(page).to have_content("Dumb event")
    click_link "delete"
    expect(page).to have_no_content("Dumb event")
  end
end
