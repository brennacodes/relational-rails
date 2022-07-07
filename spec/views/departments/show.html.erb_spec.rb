require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      name: "Name",
      address: "MyText",
      jurisdiction: "Jurisdiction",
      active_cases: 2,
      is_federal: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Jurisdiction/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
