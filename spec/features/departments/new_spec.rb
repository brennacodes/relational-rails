require 'rails_helper'

RSpec.describe "departments index page" do

  before do
    visit "/departments/new"
  end
  
  it "renders a new department form" do
    expect(page).to have_rendered('new')
    # fill_in('Name', with: "CIA")
    # fill_in 'Address', with: "010 Federal Way, Washington D.C. 80989"
    # fill_in 'Jurisdiction', with: "United States of America"
    # fill_in 'Active Cases', with: 964
    # fill_in 'Is Federal', with: true
    # click_button "Create Department"
    # expect(current_path).to eq("/departments")
    # expect(page).to have_content("CIA")
    # expect(page).to have_field(name)
    # expect(page).to have_field("Address")
    # expect(page).to have_field("Jurisdiction")
    # expect(page).to have_field("Active Cases")
    # expect(page).to have_field("Is Federal")
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

  xit "successfully creates a new department", type: :feature do
    fill_in 'Name', with: "CIA"
    fill_in 'Address', with: "010 Federal Way, Washington D.C. 80989"
    fill_in 'Jurisdiction', with: "United States of America"
    fill_in 'Active Cases', with: 964
    fill_in 'Is Federal', with: true
    click_button "Create Department"
    it { should have_http_status(:ok) }
    it { should render_template("departments/show") }
    it { should have_content("CIA") }
  end
end