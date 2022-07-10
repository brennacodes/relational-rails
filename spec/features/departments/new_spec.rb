require 'rails_helper'

RSpec.describe "departments index page", type: :feature do

  before do
    visit "/departments/new"
  end
  
    describe "Navbar Links", type: :feature do
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
  
  it "renders a new department form" do
    fill_in 'department[name]', with: "CIA"
    fill_in 'department[address]', with: "010 Federal Way, Washington D.C. 80989"
    fill_in 'department[jurisdiction]', with: "United States of America"
    fill_in 'department[active_cases]', with: 964
    select 'True', from: 'department_is_federal'
  end

  it "successfully creates a new department" do
    fill_in 'department[name]', with: "CIA"
    fill_in 'department[address]', with: "010 Federal Way, Washington D.C. 80989"
    fill_in 'department[jurisdiction]', with: "United States of America"
    fill_in 'department[active_cases]', with: 964
    select 'True', from: 'department_is_federal'
    click_on 'Submit'
    expect(current_path).to eq('/departments')
  end
end