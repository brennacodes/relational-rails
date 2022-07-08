require 'rails_helper'

RSpec.describe "cases index page", type: :feature do
  it "can see all cases subject" do
    fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
    case_1 = fbi.cases.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
    visit "/cases"
    expect(page).to have_content(case_1.subject)
    expect(page).to have_content(case_1.uid)
    # expect(page).to have_content(case_2.subject)
    # expect(page).to have_content("#{case_2.uid}")
  end
end