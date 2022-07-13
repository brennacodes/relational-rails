require 'rails_helper'

RSpec.describe 'it shows information on an department based on id' do
  before do
    @fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
    visit "/investigations/#{@case_1.id}/edit"
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

  it 'can update an investigation record' do
    fill_in 'subject', with: "Felony Assault with Hot Dog"
    fill_in 'uid', with: "abcd1234"
    fill_in 'active_leads', with: 0
    select 'False', from: 'active'

    click_button 'Save'
    expect(current_path).to eq(investigation_path(@case_1.id))
    expect(page).to have_content("Felony Assault with Hot Dog")
    expect(page).to have_content("abcd1234")
    expect(page).to have_content(0)
    expect(page).to have_content(false)
  end
end