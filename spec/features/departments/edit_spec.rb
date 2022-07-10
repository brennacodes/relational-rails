require 'rails_helper'

RSpec.describe "edit department page", type: :feature do

  before do
    @department_1 = Department.create!(name: "Federal Bureau of Investigations",
                                      address: "123 Wanted Way, Washington D.C. 01020",
                                      jurisdiction: "federal",
                                      active_cases: 0,
                                      is_federal: true,
                                      created_at: "1993-01-01 00:00:00 UTC")
    @department_2 = Department.create!(name: "Boulder Police Department",
                                      address: "321 Pearl Street, Boulder, CO 12345",
                                      jurisdiction: "municipal",
                                      active_cases: 0,
                                      is_federal: true,
                                      created_at: "1997-01-01 00:00:00 UTC")
  end

  describe "Navbar Links" do
    describe "Navigation should be available" do
      it "should include links" do
        visit "departments/#{@department_1.id}/edit"
        page.should have_link('Departments')
        page.should have_link('Investigations')
      end

      it "has links that point to the correct pages" do
        visit "departments/#{@department_1.id}/edit"
        expect(page).to have_link('Departments', href: '/departments')
        expect(page).to have_link('Investigations', href: '/investigations')
      end
    end
  end
  
  describe "it can edit a department" do
    it 'has a button on the parent page to edit a department' do
      visit "/departments"
      expect(page).to have_link('Edit')
      click_on 'Edit', match: :first
      expect(current_path).to eq("/departments/#{@department_2.id}/edit")
    end

    it "renders an edit department form" do
      visit "/departments"
      click_on 'Edit'
      fill_in 'department[name]', with: "Secret Service"
      fill_in 'department[address]', with: "010 Federal Way, Washington D.C. 80989"
      fill_in 'department[jurisdiction]', with: "United States of America"
      fill_in 'department[active_cases]', with: 0
      select 'False', from: 'department_is_federal'
      click_on 'Save'
      expect(current_path).to eq("/departments/#{@department_1.id}")
    end

    it "successfully creates a new department" do
      visit "/departments"
      click_on 'Edit'
      fill_in 'department[name]', with: "Secret Service"
      fill_in 'department[address]', with: "010 Federal Way, Washington D.C. 80989"
      fill_in 'department[jurisdiction]', with: "United States of America"
      fill_in 'department[active_cases]', with: 0
      select 'False', from: 'department_is_federal'
      click_on 'Save'
      expect(current_path).to eq("/departments/#{@department_1.id}")
    end
  end
end