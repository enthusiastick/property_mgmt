require 'spec_helper'

feature "Associate views all owners" do
  # As a real estate associate
  # I want to view a list of all owners
  # So that I can refer back to pertinent information
  # Acceptance Criteria:
  # * All owners are shown
  # * Each owner links to its individual listing

  it "sees all the owners listed on the page" do
    owner1 = FactoryGirl.create(:owner)
    owner2 = FactoryGirl.create(:owner)

    visit '/owners'

    expect(page).to have_content owner1.first_name
    expect(page).to have_content owner2.last_name
  end

end

