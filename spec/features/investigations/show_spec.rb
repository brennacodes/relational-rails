require 'rails_helper'

RSpec.describe "investigations show page", type: :feature do
  before do
    @fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
    @upd = Department.create!(name: 'United States Parole Department', address: "123 Main St., Washington D.C. 12893", jurisdiction: "municipal", active_cases: 4, is_federal: false)
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
    @case_2 = @fbi.investigations.create!(subject: 'Robbery', uid: "ab132w5azef543214533", active: true, active_leads: 1)
    @case_3 = @upd.investigations.create!(subject: 'Armed Robbery', uid: "zqiupaoe28987304", active: true, active_leads: 33)
    visit "/investigations/#{@case_1.id}"
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
  
  it "can see investigation and its attributes" do
    expect(page).to have_content(@case_1.subject)
    expect(page).to have_content(@case_1.uid)
    expect(page).to have_content(@case_1.active)
    expect(page).to have_content(@case_1.active_leads)
    expect(page).to have_content(@fbi.name)
    expect(page).not_to have_content(@case_2.subject)
    expect(page).not_to have_content(@upd.name)
    expect(page).not_to have_content(@case_3.subject)
  end

  it "has a link to edit the investigation" do
    expect(page).to have_content(@case_1.subject)
    expect(page).to have_link('Update Investigation')
    expect(page).to have_selector(:link_or_button, "Update Investigation")
    click_on "Update Investigation"
    expect(current_path).to eq(edit_investigation_path(@case_1))
  end
  
  it "takes the user to a form to edit the investigation details" do
    click_on 'Update Investigation'
    fill_in 'investigation[subject]', with: "Felony Assautl with Hot Dog"
    fill_in 'investigation[uid]', with: "abcd1234"
    fill_in 'investigation[active_leads]', with: 0
    select 'False', from: 'investigation[active]'
  end
  
  it "takes the user back to the updated investigation page" do
    click_on 'Update Investigation', match: :first
    expect(current_path).to eq("/investigations/#{@case_1.id}/edit")
    fill_in 'investigation[subject]', with: "Felony Assault with Hot Dog"
    fill_in 'investigation[uid]', with: "abcd1234"
    fill_in 'investigation[active_leads]', with: 0
    select 'False', from: 'investigation[active]'
    click_button 'Submit'
    expect(current_path).to eq(investigation_path(@case_1.id))
    # expect(page).to have_content("Felony Assault with Hot Dog")
  end

  it "has a link to delete the investigation" do
    expect(page).to have_link('Delete')
    click_on 'Delete'
    expect(current_path).to eq("/investigations")
    expect(page).not_to have_content(@case_1.subject)
  end
end
