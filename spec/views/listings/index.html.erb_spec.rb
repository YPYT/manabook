require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        title: "Title",
        list_image: "List Image",
        price: 2,
        description: "MyText",
        condition: 3,
        sold: false,
        user: nil,
        category: nil,
        comment: nil
      ),
      Listing.create!(
        title: "Title",
        list_image: "List Image",
        price: 2,
        description: "MyText",
        condition: 3,
        sold: false,
        user: nil,
        category: nil,
        comment: nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "List Image".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
