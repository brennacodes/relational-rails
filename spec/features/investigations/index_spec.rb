require 'rails_helper'

RSpec.describe "investigations index page", type: :feature do

  before do
    @fbi = Department.create!(name: 'Federal Bureau of Investigations', address: "010 Federal Way, Washington D.C. 80989", jurisdiction: "United States of America", active_cases: 964, is_federal: true)
    @upd = Department.create!(name: 'United States Parole Department', address: "123 Main St., Washington D.C. 12893", jurisdiction: "municipal", active_cases: 4, is_federal: false)
    @case_1 = @fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345, created_at: "1993-01-01 00:00:00 UTC")
    @case_2 = @fbi.investigations.create!(subject: 'Robbery', uid: "ab132w5azef543214533", active: true, active_leads: 1, created_at: "1990-01-01 00:00:00 UTC")
    @case_4 = @upd.investigations.create!(subject: 'Armed Robbery', uid: "zqiupaoe28987304", active: true, active_leads: 33, created_at: "1999-01-01 00:00:00 UTC")
    @case_3 = @fbi.investigations.create!(subject: 'Felony Assault with Hot Dog', uid: "ab132w5azef5432324", active: false, active_leads: 21, created_at: "2017-01-01")
    visit "/investigations"
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
    end
  end

  it "can only see investigations that are active (true)" do
    expect(page).to have_content("Missing Person")
    expect(page).to have_content("Robbery")
    expect(page).to_not have_content("Felony Assault with Hot Dog")
    expect(page).to have_content("Armed Robbery")
  end
  
  it "can see date created for each investigation" do
    expect(page).to have_content("1993-01-01 00:00:00 UTC")
    expect(page).to have_content("1990-01-01 00:00:00 UTC")
    expect(page).not_to have_content("2017-01-01")
    expect(page).to have_content("1999-01-01 00:00:00 UTC")
  end

  it "can see all investigations listed by date created" do
    @ordered = Investigation.sort_created_descend
    @active_investigations = @ordered.show_true
    @cases = [@case_4, @case_1, @case_2]
    expect(@active_investigations).to eq(@cases)
  end

  it "can click on a case to see more information" do
    click_link("Missing Person")
    expect(page).to have_content("Missing Person")
    expect(page).to have_content("abalke83792ks1001")
    expect(page).to have_content("true")
    expect(page).to have_content("345")
  end

  it "has links to edit each investigation" do
    expect(page).to have_button('Edit')
    click_on 'Edit', match: :first
    expect(current_path).to eql("/investigations/#{@case_4.id}/edit")
    visit "/investigations"
    click_on 'Date Created'
    click_on 'Edit', match: :first
    expect(current_path).to eql("/investigations/#{@case_2.id}/edit")
  end

  it "has a link to delete the investigation" do
    expect(page).to have_content("Missing Person")
    expect(page).to have_content("Robbery")
    expect(page).to have_content("Armed Robbery")
    expect(page).not_to have_content("Felony Assault with Hot Dog")
    expect(page).to have_button('Delete')
    click_on 'Delete', match: :first
    expect(current_path).to eql("/investigations")  
    expect(page).to have_content("Missing Person")
    expect(page).to have_content("Robbery")
    expect(page).not_to have_content("Armed Robbery")
    expect(page).not_to have_content("Felony Assault with Hot Dog")
    click_on 'Delete', match: :first
    expect(current_path).to eql("/investigations")
    expect(page).to have_content("Robbery")
    expect(page).not_to have_content("Missing Person")
    expect(page).not_to have_content("Armed Robbery")
    expect(page).not_to have_content("Felony Assault with Hot Dog")
  end

  it "can sort by any column" do
    expect(page).to have_selector(:link_or_button, "Subject")
    within('tbody') do
      expect(page.all('td')[0].text).to eq("Armed Robbery")
    end
    within('thead') do
      click_on "Subject"
    end
    within('tbody') do
      expect(page.all('td')[0].text).to eq("Robbery")
    end

    visit "/investigations"
    expect(page).to have_selector(:link_or_button, "UID")
    within('tbody') do
      expect(page.all('td')[1].text).to eq("zqiupaoe28987304")
    end
    within('thead') do
      click_on "UID"
    end
    within('tbody') do
      expect(page.all('td')[1].text).to eq("ab132w5azef543214533")
    end

    visit "/investigations"
    expect(page).to have_selector(:link_or_button, "Active Leads")
    within('tbody') do
      expect(page.all('td')[3].text).to eq("33")
    end
    within('thead') do
      click_on "Active Leads"
    end
    within('tbody') do
      expect(page.all('td')[3].text).to eq("1")
    end

    visit "/investigations"
    expect(page).to have_selector(:link_or_button, "Department")
    within('tbody') do
      expect(page.all('td')[4].text).to eq("United States Parole Department")
    end
    within('thead') do
      click_on "Department"
    end
    within('tbody') do
      expect(page.all('td')[4].text).to eq("Federal Bureau of Investigations")
    end
  end
end