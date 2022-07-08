class RemoveListImageFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :list_image, :string
  end
end
