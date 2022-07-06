# when i visit /parents
# i see the name of each record in the system
require 'rails_helper'

RSpec.describe "divisions index page", type: :feature do
  it "can see all divisions names" do
    division_1 = Division.create(name: "Federal Bureau of Investigations",
                                 address: "123 Wanted Way, Washington D.C. 01020",
                                 jurisdiction: "federal",
                                 num_active_cases: 934,
                                 is_federal: true)
    division_2 = Division.create(name: "Boulder Police Department",
                                 address: "321 Pearl Street, Boulder, CO 12345",
                                 jurisdiction: "municipal",
                                 num_active_cases: 122,
                                 is_federal: false)

    visit "/divisions"

    expect(page).to have_content(division_1.name)
    expect(page).to have_content("Address: #{division_1.address}")
    expect(page).to have_content(division_2.name)
    expect(page).to have_content("Address: #{division_2.address}")
  end
end