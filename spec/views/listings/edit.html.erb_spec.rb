require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
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

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

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
