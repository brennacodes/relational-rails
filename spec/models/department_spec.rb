require 'rails_helper'

RSpec.describe Department, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :investigations }
  end
end
