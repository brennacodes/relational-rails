require 'rails_helper'

RSpec.describe "cases/new", type: :view do
  before(:each) do
    assign(:case, Case.new(
      subject: "Missing Person",
      uid: "ab132w5azef543214533",
      active: true,
      active_leads: 1,
      department: 1
    ))
  end

  it "renders new case form" do
    render

    assert_select "form[action=?][method=?]", cases_path, "post" do

      assert_select "input[name=?]", "case[subject]"

      assert_select "input[name=?]", "case[uid]"

      assert_select "input[name=?]", "case[active]"

      assert_select "input[name=?]", "case[active_leads]"

      assert_select "input[name=?]", "case[department_id]"
    end
  end
end
