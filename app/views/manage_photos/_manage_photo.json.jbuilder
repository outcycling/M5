json.extract! manage_photo, :id, :requestor_id, :requestee_id, :granted, :created_at, :updated_at
json.url manage_photo_url(manage_photo, format: :json)
