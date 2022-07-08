require 'rails_helper'

RSpec.describe "departments show page", type: :feature do
  let!(:fbi) {Department.create!(id: 1,
                                 name: 'Federal Bureau of Investigations', 
                                 address: "010 Federal Way, Washington D.C. 80989", 
                                 jurisdiction: "United States of America", 
                                 active_cases: 964, 
                                 is_federal: true)
              }
  let!(:upd) {Department.create!(id: 2,
                                 name: 'Urban Police Department', 
                                 address: "777 Local Lane, Boulder, CO 80304", 
                                 jurisdiction: "Local County", 
                                 active_cases: 61, 
                                 is_federal: false)
              }

  before do
    visit "/departments/#{fbi.id}"
  end

  it "can see departments name and address" do
    expect(page).to have_content(fbi.name)
    expect(page).to have_content(fbi.address)
    expect(page).to have_content(fbi.jurisdiction)
    expect(page).to have_content(fbi.active_cases)
    expect(page).to have_no_content(upd.name)
    expect(page).to have_no_content(upd.address)
  end

  it "links to a table of all associated investigations" do
    click_link "View Active Cases"
    expect(current_path).to eq("/departments/#{fbi.id}/investigations")
    # expect(page).to have_content(fbi.name)
    # expect(page).to have_content("Missing Person")
    # expect(page).not_to have_content("Robbery")
  end

  it "lists the number of active cases" do
    expect(page).to have_content("Active Cases: #{fbi.active_cases.count}")
  end

end