require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations" do
    it { should validate_presence_of :name } 
  end

  describe 'relationships' do
    it { should have_many :investigations }
  end

  describe 'displays created_at datetime information' do
    it { should have_db_column(:created_at).of_type(:datetime) }
  end
  
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
end
