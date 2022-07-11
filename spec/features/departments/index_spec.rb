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
    @case_1 = @department_1.investigations.create!(subject: 'Missing Person', 
                                      uid: "fbilke83792ks1001", 
                                      active: true, 
                                      active_leads: 345)    
    @case_2 = @department_1.investigations.create!(subject: 'Robbery',
                                      uid: "fb132w5azef543214533",  
                                      active: true,
                                      active_leads: 1)
    visit "/departments"
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

  it "has a link to create a new department" do
    expect(page).to have_link('New Department', href: '/departments/new')
  end

  it "opens a new department page" do
    click_on 'New Department'
    expect(current_path).to eq('/departments/new')
  end

  it "has a link to edit a department" do
    expect(page).to have_link('Edit')
  end

  it "opens an edit department page" do
    click_on 'Edit', match: :first
    expect(current_path).to eq("/departments/#{@department_2.id}/edit")
  end

  it "has a link to delete a department" do
    expect(page).to have_button('Delete')
    click_on 'Delete', match: :first
    expect(page).not_to have_content(@department_2.name)
  end
end