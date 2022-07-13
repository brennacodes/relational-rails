require 'rails_helper'

RSpec.describe "departments index page", type: :feature do
  before do
    @department_1 = Department.create!(name: "Federal Bureau of Investigations",
                                      address: "123 Wanted Way, Washington D.C. 01020",
                                      jurisdiction: "federal",
                                      active_cases: 0,
                                      is_federal: true,
                                      created_at: "1993-01-01 00:00:00 UTC")
    @department_2 = Department.create!(name: "Boulder Police Department",
                                      address: "321 Pearl Street, Boulder, CO 12345",
                                      jurisdiction: "municipal",
                                      active_cases: 0,
                                      is_federal: true,
                                      created_at: "1997-01-01 00:00:00 UTC")
    @case_1 = @department_1.investigations.create!(subject: 'Missing Person', 
                                      uid: "fbilke83792ks1001", 
                                      active: true, 
                                      active_leads: 345)    
    @case_2 = @department_1.investigations.create!(subject: 'Robbery',
                                      uid: "fb132w5azef543214533",  
                                      active: true,
                                      active_leads: 1)
    @case_3 = @department_2.investigations.create!(subject: 'Felony Assault with Hot Dog',
                                      uid: "bpd32w5azef543214223",  
                                      active: true,
                                      active_leads: 14)
    visit "/departments"
  end

  describe "Navbar" do
    describe "should be available" do
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

  it "can see departments attributes" do
    expect(page).to have_content("#{Department}")
    expect(page).to have_content(@department_1.name)
    expect(page).to have_content("#{@department_1.address}")
    expect(page).to have_content("#{@department_1.jurisdiction}")
    expect(page).to have_content("#{@department_1.active_cases}")
    expect(page).to have_content("#{@department_1.is_federal}")
    expect(page).to have_content("#{@department_1.created_at}")
    expect(page).to have_content(@department_2.name)
    expect(page).to have_content("#{@department_2.address}")
    expect(page).to have_content("#{@department_2.jurisdiction}")
    expect(page).to have_content("#{@department_2.active_cases}")
    expect(page).to have_content("#{@department_2.is_federal}")
    expect(page).to have_content("#{@department_2.created_at}")
  end

  it "can click department names to view info on that department" do
    click_on @department_1.name
    expect(current_path).to eq("/departments/#{@department_1.id}")
    expect(page).to have_content(@department_1.name)
    visit '/departments'
    click_on @department_2.name
    expect(current_path).to eq("/departments/#{@department_2.id}")
    expect(page).to have_content(@department_2.name)
  end

  it "can see all departments date created" do
    expect(page).to have_content("#{@department_1.created_at}")
    expect(page).to have_content("#{@department_2.created_at}")
  end

  it "can see all departments listed by date created" do
    ordered = Department.order(created_at: :desc)
    expect(ordered).to eq([@department_2, @department_1])
  end

  it "has a link to create a new department" do
    expect(page).to have_link('New Department', href: '/departments/new')
    click_on 'New Department'
    expect(current_path).to eq('/departments/new')
  end

  it "has links to update each department" do
    click_on 'Edit', match: :first
    expect(current_path).to eq("/departments/#{@department_2.id}/edit")
    visit '/departments'
    click_on "Active Cases"
    click_on "Active Cases"
    click_on 'Edit', match: :first
    expect(current_path).to eq("/departments/#{@department_1.id}/edit")
  end


  it "has a link next to each department do delete that department" do
    expect(page).to have_button('Delete')
    click_on 'Delete', match: :first
    expect(page).not_to have_content(@department_2.name)
    expect(page).to have_content("#{@department_1.name}")
  end
  
  it 'can click to sort departments by number of cases' do
    @department_3 = Department.create!(name: "Denver Police Department",
                                       address: "121 Larimer Street, Denver, CO 54321",
                                       jurisdiction: "municipal",
                                       active_cases: 0,
                                       is_federal: false,
                                       created_at: "1989-01-01 00:00:00 UTC")
    
    expect(page).to have_selector(:link_or_button, "Active Cases")
    click_on ("Active Cases")
    expect(current_path).to eql("/departments")
    
    within "tbody" do
      expect(page.all('td')[0]).to have_content("Denver Police Department")
    end
    
    click_on ("Active Cases")
    expect(current_path).to eql("/departments")

    within "tbody" do
      expect(page.all('td')[0]).to have_content("Federal Bureau of Investigations")
    end
  end

end