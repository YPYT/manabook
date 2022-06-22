require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      title: "MyString",
      list_image: "MyString",
      price: 1,
      description: "MyText",
      condition: 1,
      sold: false,
      user: nil,
      category: nil,
      comment: nil
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[list_image]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[condition]"

      assert_select "input[name=?]", "listing[sold]"

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[category_id]"

      assert_select "input[name=?]", "listing[comment_id]"
    end
  end
end
