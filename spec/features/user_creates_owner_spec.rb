require 'spec_helper'

feature "Associate creates an owner" do
  # As a real estate associate
  # I want to record a building owner
  # So that I can keep track of our relationships with owners
  # Acceptance Criteria:
  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information, I am presented with errors
  # * If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context "with valid attributes" do
    it "lists an owner successfully" do
      visit "/owners/new"

      fill_in "First", with: "Ron"
      fill_in "Last", with: "Swanson"
      fill_in "Email", with: "ronswanson@example.com"
      fill_in "Company", with: "Parks & Rec"

      click_on "Create Owner"

      expect(page).to have_content "successfully"
      page.has_link?("owners_path")
    end
  end

  context "with invalid attributes" do
    it "displays errors" do
      visit "/owners/new"

      click_on "Create Owner"
      expect(page).to have_content "Error"
    end
  end

end

