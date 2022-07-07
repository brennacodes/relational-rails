require 'rails_helper'

RSpec.describe "cases/show", type: :view do
  before(:each) do
    @case = assign(:case, Case.create!(
      subject: "Missing Person",
      uid: "ab132w5azef543214533",
      active: true,
      active_leads: 1,
      department: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
