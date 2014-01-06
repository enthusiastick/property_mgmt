require 'spec_helper'

feature "Associate records a building with an owner" do
  # As a real estate associate
  # I want to correlate an owner with buildings
  # So that I can refer back to pertinent information
  # Acceptance Criteria:
  # * When recording a building, I want to optionally associate the building with its rightful owner.

  it "lists a building successfully" do
    owner = FactoryGirl.create(:owner)
    visit "/buildings/new"

    fill_in "Street Address", with: "742 Evergreen Terrace"
    fill_in "City", with: "Springfield"
    select("OR", :from => "State")
    fill_in "Postal Code", with: "97477"
    fill_in "Description", with: ""
    select("Foo Bar", :from => "Owner")

    click_on "Create Building"

    expect(page).to have_content "successfully"
    page.has_link?("buildings_path")
  end


end

