json.extract! listing, :id, :title, :list_image, :price, :description, :condition, :sold, :user_id, :category_id, :comment_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
