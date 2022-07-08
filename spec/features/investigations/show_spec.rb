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
    visit "/investigations/#{@case_1.id}"
  end

  it 'links to the investigations index at the top of every page' do
    expect(current_path).to eql("/investigations/#{@case_1.id}")
    expect(page).to have_content("#{@case_1.subject}")
    expect(page).not_to have_content("Wanted Fugitive")
  end
  it "can see investigations attributes" do
    expect(page).to have_content(@case_1.subject)
    expect(page).to have_content(@case_1.uid)
    expect(page).to have_content(@case_1.active)
    expect(page).to have_content(@case_1.active_leads)
    expect(page).to have_content(@fbi.name)
    expect(page).not_to have_content("Wanted Fugitive")
    expect(page).not_to have_content("fbialke83792ks1188")
  end

end