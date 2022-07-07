require 'rails_helper'

RSpec.describe "cases/edit", type: :view do
  before(:each) do
    @case = assign(:case, Case.create!(
      subject: "Missing Person",
      uid: "ab132w5azef543214533",
      active: true,
      active_leads: 1,
      department: 1
    ))
  end

  it "renders the edit case form" do
    render

    assert_select "form[action=?][method=?]", case_path(@case), "post" do

      assert_select "input[name=?]", "case[subject]"

      assert_select "input[name=?]", "case[uid]"

      assert_select "input[name=?]", "case[active]"

      assert_select "input[name=?]", "case[active_leads]"

      assert_select "input[name=?]", "case[department_id]"
    end
  end
end
