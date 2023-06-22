require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      code: "1000",
      description: "Description 3",
      category_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1000/)
    expect(rendered).to match(/Description 3/)
    expect(rendered).to match(/2/)
  end
end
