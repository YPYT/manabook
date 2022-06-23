class RemoveDetailsFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :grade, :string
    remove_column :categories, :subject, :string
  end
end
