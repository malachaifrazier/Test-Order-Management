require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      state: "complete",
      control_number: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/complete/)
    expect(rendered).to match(/2/)
  end
end
