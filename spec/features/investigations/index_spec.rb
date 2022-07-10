require 'rails_helper'

RSpec.describe "investigations index page", type: :feature do

  before do
    @fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
    @case_2 = @fbi.investigations.create!(subject: 'Robbery', uid: "ab132w5azef543214533", active: true, active_leads: 1)
    visit "/investigations"
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

  it 'links to the investigations index at the top of every page' do
    expect(current_path).to eql("/investigations")
    expect(page).to have_content("#{@case_1.subject}")
    expect(page).not_to have_content("Wanted Fugitive")
  end

  it "can see all investigations" do
    expect(page).to have_content(@case_1.subject)
    expect(page).to have_content(@case_1.uid)
    expect(page).to have_content(@case_2.subject)
    expect(page).to have_content(@case_2.uid)
  end
  
  it "can see all investigations date created" do
    expect(page).to have_content(@case_1.created_at)
    expect(page).to have_content(@case_2.created_at)
  end

  it "can see all investigations listed by date created" do
    ordered = Investigation.sort_created_descend
    expect(ordered).to eq([@case_2, @case_1])
  end
end