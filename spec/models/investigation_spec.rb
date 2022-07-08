require 'rails_helper'

RSpec.describe Investigation, type: :model do
  before(:each) do
      Investigation.create!(subject: "Missing Person",
      uid: "ab132w5azef543214533",
      active: true,
      active_leads: 1,
      department_id: 1
    )
  end
end
