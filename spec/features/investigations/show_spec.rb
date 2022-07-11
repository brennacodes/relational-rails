require 'rails_helper'

RSpec.describe "investigations show page", type: :feature do
  before do
    @fbi = Department.create!(name: 'Federal Bureau of Investigations', 
                                 address: "010 Federal Way, Washington D.C. 80989", 
                                 jurisdiction: "United States of America", 
                                 active_cases: 964, 
                                 is_federal: true)  
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', 
                                          uid: "fbilke83792ks1001", 
                                          active: true, 
                                          active_leads: 345)    
    @case_2 = @fbi.investigations.create!(subject: 'Robbery',
                                          uid: "fb132w5azef543214533",  
                                          active: true,
                                          active_leads: 1)
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
    expect(page).not_to have_content("Wanted Fugitive")
    expect(page).not_to have_content("fbialke83792ks1188")
  end

  it "has a link to the edit page for this investigation" do
    expect(page).to have_link('Edit')
  end

  it "has an edit button takes user to edit page for that case" do
    expect(page).to have_link('Edit')
    click_on 'Edit', match: :first
    expect(current_path).to eq(edit_investigation_path(@case_1))
  end
  
  it "takes the user to a form to edit an investigation" do
    expect(page).to have_link('Edit')
    click_on 'Edit', match: :first
    expect(current_path).to eq(edit_investigation_path(@case_1))
    fill_in 'investigation[subject]', with: "Felony Assautl with Hot Dog"
    fill_in 'investigation[uid]', with: "abcd1234"
    fill_in 'investigation[active_leads]', with: 0
    select 'False', from: 'investigation[active]'
  end
  
  it "takes the user to a form to edit an investigation" do
    click_on 'Edit', match: :first
    expect(current_path).to eq(edit_investigation_path(@case_1))
    fill_in 'investigation[subject]', with: "Felony Assault with Hot Dog"
    fill_in 'investigation[uid]', with: "abcd1234"
    fill_in 'investigation[active_leads]', with: 0
    select 'False', from: 'investigation[active]'
    click_on 'Save'
    expect(current_path).to eq(investigation_path(@case_1.id))
    # expect(page).to have_content("Felony Assault with Hot Dog")
  end

  it "has a link to delete the investigation" do
    expect(page).to have_link('Delete')
    click_on 'Delete'
    expect(current_path).to eq("/investigations")
    expect(page).not_to have_content('Missing Person')
  end
end