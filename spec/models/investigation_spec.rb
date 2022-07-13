require 'rails_helper'

RSpec.describe Investigation, type: :model do
  before(:each) do
    @fbi = Department.create!(id: 1,
                              name: 'Federal Bureau of Investigations', 
                              address: "010 Federal Way, Washington D.C. 80989", 
                              jurisdiction: "United States of America", 
                              active_cases: 964, 
                              is_federal: true
                              ) 
    @case_1 = Investigation.create!(subject: "Missing Person",
                                    uid: "ab132w5azef543214533",
                                    active: true,
                                    active_leads: 1,
                                    department_id: 1,
                                    created_at: "2018-01-01 00:00:00",
                                  )
    @case_2 = Investigation.create!(subject: "Hamburglar",
                                    uid: "ab132w5azef543223443",
                                    active: false,
                                    active_leads: 2,
                                    department_id: 1,
                                    created_at: "2022-01-01 00:00:00",
                                  )
  end

  describe "validations" do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:active_leads) }
    it { should validate_uniqueness_of(:uid) }
  end

  describe "associations" do
    it { should belong_to(:department) }
  end

  describe "class methods" do
    describe "sort by" do
      it "should sort investigations by created_at with newest first" do
        sorted = Investigation.sort_created_descend
        expect(sorted.first).to eq(@case_2)
        expect(Investigation.sort_created_descend).to eq([@case_2, @case_1])
        expect(Investigation.sort_created_descend).not_to eq([@case_1, @case_2])
      end

      describe "show_true" do
        it "should only return active investigations" do
          expect(Investigation.show_true).to eq([@case_1])
        end
      end

      describe "search" do
        it "should return investigations that match the search term" do
          expect(Investigation.search_investigations("miss")).to eq([@case_1])
          expect(Investigation.search_investigations(3443)).to eq([@case_2])
        end
      end
    end
  end

end
