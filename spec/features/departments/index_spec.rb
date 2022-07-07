require 'rails_helper'

RSpec.describe "divisions index page", type: :feature do
  it "can see all divisions names" do
    department_1 = Department.create!(name: "Federal Bureau of Investigations",
                                      address: "123 Wanted Way, Washington D.C. 01020",
                                      jurisdiction: "federal",
                                      active_cases: 934,
                                      is_federal: true)
    department_2 = Department.create!(name: "Boulder Police Department",
                                      address: "321 Pearl Street, Boulder, CO 12345",
                                      jurisdiction: "municipal",
                                      active_cases: 122,
                                      is_federal: false)

    visit "/departments"

    expect(page).to have_content(department_1.name)
    expect(page).to have_content("Address: #{department_1.address}")
    expect(page).to have_content(department_2.name)
    expect(page).to have_content("Address: #{department_2.address}")
  end
end