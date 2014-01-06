require 'spec_helper'

feature "Associate records a building" do
  # As a real estate associate
  # I want to record a building
  # So that I can refer back to pertinent information
  # Acceptance Criteria:
  # * I must specify a street address, city, state, and postal code
  # * Only US states can be specified
  # * I can optionally specify a description of the building
  # * If I enter all of the required information in the required format, the building is recorded.
  # * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # * Upon successfully creating a building, I am redirected so that I can record another building.

  context "with valid attributes" do
    it "lists a building successfully" do
      visit "/buildings/new"

      fill_in "Street Address", with: "742 Evergreen Terrace"
      fill_in "City", with: "Springfield"
      select("OR", :from => "State")
      fill_in "Postal Code", with: "97477"
      fill_in "Description", with: ""

      click_on "Create Building"

      expect(page).to have_content "successfully"
      page.has_link?("buildings_path")
    end
  end

  context "with invalid attributes" do
    it "displays errors" do
      visit "/buildings/new"

      click_on "Create Building"
      expect(page).to have_content "Error"
    end
  end

end

