require 'rails_helper'

RSpec.describe "investigations index page", type: :feature do

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
                                          uid: "abalke83792ks1001", 
                                          active: true, 
                                          active_leads: 345)
    @case_2 = @upd.investigations.create!(subject: 'Robbery', 
                                          uid: "ab132w5azef543214533", 
                                          active: true, 
                                          active_leads: 1)

    visit "/departments/1/investigations"
  end

  describe "Navbar Links" do
    describe "Navigation should be available" do
      it "should include links" do
        expect(page).to have_link('Departments')
        expect(page).to have_link('Investigations')
      end

      it "has links that point to the correct pages" do
        expect(page).to have_link('Departments', href: '/departments')
        expect(page).to have_link('Investigations', href: '/investigations')
      end
    end
  end

  describe 'page' do
    it 'only shows investigations for a specific department' do
      expect(page).to have_content(@case_1.subject)
      expect(page).to have_content(@case_1.uid)
      expect(page).not_to have_content(@case_2.subject)
      expect(page).not_to have_content(@case_2.uid)
    end

    it 'has a link to the show page for each investigation' do
      expect(page).to have_link(@case_1.subject, href: "/investigations/#{@case_1.id}")
      expect(page).not_to have_link(@case_2.subject, href: "/investigations/#{@case_2.id}")
    end

    it 'has a link to add a new investigation for this department' do
      expect(page).to have_link('New Investigation', href: "/departments/#{@fbi.id}/investigations/new")
    end

    it 'can add a new investigation for this department' do
      expect(page).to have_link('New Investigation', href: "/departments/#{@fbi.id}/investigations/new")
      click_on 'New Investigation'
      expect(current_path).to eq("/departments/#{@fbi.id}/investigations/new")
    end
  end
end