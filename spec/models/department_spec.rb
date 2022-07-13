require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations" do
    it { should validate_presence_of :name } 
    it { should validate_presence_of :address } 
    it { should validate_presence_of :jurisdiction } 
    it { should validate_presence_of :active_cases } 
    it { should validate_inclusion_of(:is_federal).in_array([true, false]) }
  end

  describe 'relationships' do
    it { should have_many :investigations }
  end

  describe 'displays created_at datetime information' do
    it { should have_db_column(:created_at).of_type(:datetime) }
  end

  describe 'can manipulate data' do
    it "can see all departments listed by date created" do
      @department_1 = Department.create!(name: "Federal Bureau of Investigations",
        address: "123 Wanted Way, Washington D.C. 01020",
        jurisdiction: "federal",
        active_cases: 934,
        is_federal: true,
        created_at: "1993-01-01 00:00:00 UTC")
      @department_2 = Department.create!(name: "Boulder Police Department",
        address: "321 Pearl Street, Boulder, CO 12345",
        jurisdiction: "municipal",
        active_cases: 122,
        is_federal: true,
        created_at: "1997-01-01 00:00:00 UTC")
        ordered = Department.order(created_at: :desc)
        expect(ordered).to eq([@department_2, @department_1])
    end

    it "can see the number of caes for each department" do
      @fbi = Department.create!(name: "Federal Bureau of Investigations",
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
      @case_1 = @fbi.investigations.create!(subject: 'Missing Person', uid: "abalke83792ks1001", active: true, active_leads: 345)
      @case_2 = @fbi.investigations.create!(subject: 'Robbery', uid: "ab132w5azef543214533", active: true, active_leads: 1)
      expect(@fbi.num_cases).to eq(2)
      expect(@department_2.num_cases).to eq(0)
    end

    it "can search departments" do
      @fbi = Department.create!(name: "Federal Bureau of Investigations",
        address: "123 Wanted Way, Washington D.C. 01020",
        jurisdiction: "federal",
        active_cases: 0,
        is_federal: true,
        created_at: "1993-01-01 00:00:00 UTC")
      @department_2 = Department.create!(name: "Boulder Police Department",
        address: "321 Pearl Street, Boulder, CO 12345",
        jurisdiction: "municipal",
        active_cases: 12,
        is_federal: true,
        created_at: "1997-01-01 00:00:00 UTC")
      expect(Department.search_departments("federal")).to eq([@fbi])
      expect(Department.search_departments("321")).to eq([@department_2])
      expect(Department.search_departments(12)).to eq([@department_2])
    end
  end
end
