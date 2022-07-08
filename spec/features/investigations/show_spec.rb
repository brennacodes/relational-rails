require 'rails_helper'

RSpec.describe "investigations show page", type: :feature do
  let!(:fbi) {Department.create!(name: 'Federal Bureau of Investigations', 
                                 address: "010 Federal Way, Washington D.C. 80989", 
                                 jurisdiction: "United States of America", 
                                 active_cases: 964, 
                                 is_federal: true)
              }
  let!(:case_1) {fbi.investigations.create!(subject: 'Missing Person', 
                                   uid: "fbilke83792ks1001", 
                                   active: true, 
                                   active_leads: 345)
                }
  let!(:case_2) {fbi.investigations.create!(subject: 'Wanted Fugitive', 
                                   uid: "fbialke83792ks1188", 
                                   active: false, 
                                   active_leads: 291)
                }

  before do
    visit "/investigations/#{case_1.id}"
  end

  it 'links to the investigations index at the top of every page' do
    expect(current_path).to eql("/investigations/#{case_1.id}")
    expect(page).to have_content("#{case_1.subject}")
    expect(page).not_to have_content("#{case_2.subject}")
  end
  it "can see investigations attributes" do
    expect(page).to have_content(case_1.subject)
    expect(page).not_to have_content(case_2.subject)
    expect(page).to have_content(case_1.uid)
    expect(page).not_to have_content(case_2.uid)
    expect(page).to have_content(case_1.active)
    expect(page).not_to have_content(case_2.active)
    expect(page).to have_content(case_1.active_leads)
    expect(page).not_to have_content(case_2.active_leads)
    # expect(page).to have_content(case_1.department_id)
  end

end