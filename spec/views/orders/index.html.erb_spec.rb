require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        state: "in_progress",
        control_number: 2
      ),
      Order.create!(
        state: "in_progress",
        control_number: 25
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "In Progress".to_s, count: 2
    assert_select "tr>td", text: 25.to_s, count: 1
    assert_select "tr>td", text: 2.to_s, count: 1
  end
end
