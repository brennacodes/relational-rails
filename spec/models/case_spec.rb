require 'rails_helper'

RSpec.describe Case, type: :model do
  before(:each) do
      Case.create!(subject: "Missing Person",
      uid: "ab132w5azef543214533",
      active: true,
      active_leads: 1,
      department_id: 1
    )
  end
end
