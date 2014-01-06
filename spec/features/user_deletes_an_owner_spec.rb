require 'spec_helper'

feature "Associate records a building with an owner" do
  # As a real estate associate
  # I want to correlate an owner with buildings
  # So that I can refer back to pertinent information
  # Acceptance Criteria:
  # * If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  it "deletes an owner from the index" do
    owner = FactoryGirl.create(:owner)
    visit "/owners/" + owner.id.to_s

    click_on("Delete")

    expect(Owner.count).to eq(0)
  end

  it "deletes an owner associated with a building" do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building, owner: owner)
    visit "/owners/" + owner.id.to_s
    binding.pry
    click_on("Delete")
    visit "/buildings/" + building.id.to_s

  expect(page).to_not have_content "Foo Bar"

  end

end

