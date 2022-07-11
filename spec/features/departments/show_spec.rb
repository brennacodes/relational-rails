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
  let!(:case_1) {fbi.investigations.create!(subject: 'Missing Person',
                                            uid: "fbilke83792ks1001",
                                            active: true,
                                            active_leads: 345)
               }
  let!(:case_2) {fbi.investigations.create!(subject: 'Robbery',
                                            uid: "fb132w5azef543214533",
                                            active: true,
                                            active_leads: 1)
                }

  before do
    visit "/departments/#{fbi.id}"
  end

  describe "Navbar Links" do
    describe "Navigation should be available" do
      it "should include links" do
        page.should have_link('Departments')
        page.should have_link('Investigations')
      end

      it "has links that point to the correct pages" do
        expect(page).to have_link('Departments', href: '/departments')
        expect(page).to have_link('Investigations', href: '/investigations')
      end
    end
  end

  it "can see departments name and address" do
    expect(page).to have_content(fbi.name)
    expect(page).to have_content(fbi.address)
    expect(page).to have_content(fbi.jurisdiction)
    expect(page).to have_content(fbi.num_cases)
    expect(page).not_to have_content(upd.name)
    expect(page).not_to have_content(upd.address)
  end

  it "links to a table of all associated investigations" do
    click_on 'View All Cases'
    expect(current_path).to eq("/departments/#{fbi.id}/investigations")
    expect(page).to have_content(case_1.subject)
    expect(page).to have_content(case_1.uid)
    expect(page).to have_content(case_1.active)
    expect(page).to have_content(case_1.active_leads)
    expect(page).to have_content(case_2.subject)
    expect(page).to have_content(case_2.uid)
    expect(page).to have_content(case_2.active)
    expect(page).to have_content(case_2.active_leads)
  end

  it "lists the number of active cases" do
    expect(page).to have_content(" 2 ")
    expect(page).to have_content(@num_cases)
  end

  it "only shows department with selected id" do
    visit '/departments'
    click_on 'Federal Bureau of Investigations'
    expect(current_path).to eq("/departments/#{fbi.id}")
  end

  it "can pull investigations for selected department id" do
    click_on 'View All Cases'
    expect(current_path).to eq("/departments/#{fbi.id}/investigations")
    @investigations = Investigation.where({'department_id' => fbi.id})
    count = @investigations.count
    expect(count).to eq(2)
  end

  it "has a link to delete the department" do
    expect(page).to have_button('Delete')
    click_button 'Delete', match: :first
    expect(current_path).to eq("/departments")
    expect(page).not_to have_content('Federal Bureau of Investigations')
    visit '/investigations'
    expect(page).not_to have_content('Missing Person')
    expect(page).not_to have_content('Robbery')
  end

end