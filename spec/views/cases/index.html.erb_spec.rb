require 'rails_helper'

RSpec.describe "cases/index", type: :view do
  before(:each) do
    assign(:cases, [
      Case.create!(
        subject: "Missing Person",
        uid: "ab132w5azef543214533",
        active: true,
        active_leads: 1,
        department: 1
      ),
      Case.create!(
        subject: "Wanted Fugitive",
        uid: "ab132w5azef5jksi4553",
        active: true,
        active_leads: 1,
        department: 1
      )
    ])
  end

  it "renders a list of cases" do
    render
    assert_select "tr>td", text: "Subject".to_s, count: 2
    assert_select "tr>td", text: "Uid".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
