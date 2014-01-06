require 'spec_helper'

feature "Associate views all buildings" do
  # As a real estate associate
  # I want to view a list of all buildings
  # So that I can refer back to pertinent information
  # Acceptance Criteria:
  # * All buildings are shown
  # * Each building links to its individual listing

  it "sees all the buildings listed on the page" do
    building1 = FactoryGirl.create(:building)
    building2 = FactoryGirl.create(:building)

    visit '/'

    expect(page).to have_content building1.address
    expect(page).to have_content building2.address
  end

end

