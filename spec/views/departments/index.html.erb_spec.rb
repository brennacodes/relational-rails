require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        name: "Name",
        address: "MyText",
        jurisdiction: "Jurisdiction",
        active_cases: 2,
        is_federal: false
      ),
      Department.create!(
        name: "Name",
        address: "MyText",
        jurisdiction: "Jurisdiction",
        active_cases: 2,
        is_federal: false
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Jurisdiction".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
