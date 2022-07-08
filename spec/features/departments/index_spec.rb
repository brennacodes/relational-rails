require 'rails_helper'

RSpec.describe "departments index page", type: :feature do
  it "can see departments name and address" do
    department_1 = Department.create!(name: "Federal Bureau of Investigations",
                                      address: "123 Wanted Way, Washington D.C. 01020",
                                      jurisdiction: "federal",
                                      active_cases: 934,
                                      is_federal: true)
    department_2 = Department.create!(name: "Boulder Police Department",
                                      address: "321 Pearl Street, Boulder, CO 12345",
                                      jurisdiction: "municipal",
                                      active_cases: 122,
                                      is_federal: true)

    visit "/departments"

    expect(page).to have_content(department_1.name)
    expect(page).to have_content("#{department_1.address}")
    expect(page).to have_content(department_2.name)
    expect(page).to have_content("#{department_2.address}")
  end

  it "can see all departments names" do
    visit "/departments"
    expect(page).to have_content("#{Department}")
  end
end