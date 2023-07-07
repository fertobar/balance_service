require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        code: "12",
        description: "Description 1",
        category_id: 2
      ),
      Product.create!(
        code: "34",
        description: "Description 2",
        category_id: 2
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("12".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Description 1".to_s), count: 1
  end
end
