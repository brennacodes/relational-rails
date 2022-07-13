require 'rails_helper'

RSpec.describe "department cases index page", type: :feature do

  before do
    @fbi = Department.create!(id:1, 
                              name: 'Federal Bureau of Investigations', 
                              address: "010 Federal Way, Washington D.C. 80989", 
                              jurisdiction: "United States of America", 
                              active_cases: 964, 
                              is_federal: true)
    @upd = Department.create!(id: 2,
                              name: 'Urban Police Department', 
                              address: "777 Local Lane, Boulder, CO 80304", 
                              jurisdiction: "Local County", 
                              active_cases: 61, 
                              is_federal: false)
                              
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', 
                                          uid: "fbilke83792ks1001", 
                                          active: true, 
                                          active_leads: 345)
    @case_3 = @fbi.investigations.create!(subject: 'Wanted', 
                                          uid: "fbilke8379312301", 
                                          active: true, 
                                          active_leads: 100)
    @case_2 = @upd.investigations.create!(subject: 'Robbery', 
                                          uid: "upd132w5azef543214533", 
                                          active: true, 
                                          active_leads: 1)

    visit "/departments/1/investigations"
  end

  describe "navbar" do
    describe "navigation should be available" do
      it "should include links" do
        expect(page).to have_link('Departments')
        expect(page).to have_link('Investigations')
      end

      it "has links that point to the correct pages" do
        expect(page).to have_link('Departments', href: '/departments')
        expect(page).to have_link('Investigations', href: '/investigations')
      end

      it "should have a search bar" do
        expect(page).to have_css('input[type="search"]')
        within('.d-flex') do
          fill_in 'search_input', with: 'miss'
          click_button 'Search'
        end
        expect(page).to have_content('Missing Person')
        expect(page).not_to have_content('Wanted')
      end
    end
  end

  describe 'department cases page' do
    it 'only shows investigations for a specific department' do
      expect(page).to have_content("Missing Person")
      expect(page).to have_content("fbilke83792ks1001")
      expect(page).not_to have_content("Robbery")
      expect(page).not_to have_content("upd132w5azef543214533")
    end

    it 'has a link to the show page for each investigation' do
      expect(page).to have_link("Missing Person", href: "/investigations/#{@case_1.id}")
      expect(page).not_to have_link("Robbery", href: "/investigations/#{@case_2.id}")
    end

    it 'has a link to add a new investigation for this department' do
      expect(page).to have_link('New Investigation', href: "/departments/#{@fbi.id}/investigations/new")
    end

    it 'can add a new investigation for this department' do
      expect(page).to have_link('New Investigation', href: "/departments/#{@fbi.id}/investigations/new")
      click_on 'New Investigation'
      expect(current_path).to eq("/departments/#{@fbi.id}/investigations/new")
    end

    it 'can add a new investigation for this department' do
      expect(page).to have_link('New Investigation', href: "/departments/#{@fbi.id}/investigations/new")
      click_on 'New Investigation'
      expect(current_path).to eq("/departments/#{@fbi.id}/investigations/new")
    end

    it "renders a new investigation form" do
      click_on 'New Investigation'
      fill_in 'Subject', with: "Felony Assautl with Hot Dog"
      fill_in 'investigation_uid', with: "abcd1234"
      fill_in 'investigation_active_leads', with: 0
      select 'False', from: 'investigation_active'
    end

    it "creates a new investigation" do
      click_on 'New Investigation'
      within '.container' do
        within 'form' do
          fill_in 'investigation_subject', with: "Felony Assault with Hot Dog"
          fill_in 'investigation_uid', with: "abcd1234"
          fill_in 'investigation_active_leads', with: 0
          select 'False', from: 'investigation_active'
          click_on 'Save'
        end
      end
      expect(current_path).to eq(department_cases_path(@fbi))
      expect(page).to have_content("Felony Assault with Hot Dog")
    end

    it "can filter investigations by number of leads" do
      expect(page).to have_field('num_leads')
      expect(page).to have_content("Missing Person")
      expect(page).to have_content("Wanted")
      expect(page).not_to have_content("Robbery")
      fill_in 'num_leads', with: 200
      within '.leads_input' do
        click_button "Search"
      end
      expect(page).to have_content("Missing Person")
      expect(page).not_to have_content("Wanted")
    end
  end
end