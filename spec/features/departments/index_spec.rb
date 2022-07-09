require 'rails_helper'

RSpec.describe "departments index page", type: :feature do

  before do
    @department_1 = Department.create!(name: "Federal Bureau of Investigations",
                                      address: "123 Wanted Way, Washington D.C. 01020",
                                      jurisdiction: "federal",
                                      active_cases: 934,
                                      is_federal: true,
                                      created_at: "1993-01-01 00:00:00 UTC")
    @department_2 = Department.create!(name: "Boulder Police Department",
                                      address: "321 Pearl Street, Boulder, CO 12345",
                                      jurisdiction: "municipal",
                                      active_cases: 122,
                                      is_federal: true,
                                      created_at: "1997-01-01 00:00:00 UTC")
    visit "/departments"
  end

  it "can see departments name and address" do
    expect(page).to have_content(@department_1.name)
    expect(page).to have_content("#{@department_1.address}")
    expect(page).to have_content(@department_2.name)
    expect(page).to have_content("#{@department_2.address}")
  end

  it "can see all departments names" do
    expect(page).to have_content("#{Department}")
  end

  it "can see all departments date created" do
    expect(page).to have_content("#{@department_1.created_at}")
    expect(page).to have_content("#{@department_2.created_at}")
  end

  it "can see all departments listed by date created" do
    ordered = Department.sort_created_descend
    expect(ordered).to eq([@department_2, @department_1])
  end

end