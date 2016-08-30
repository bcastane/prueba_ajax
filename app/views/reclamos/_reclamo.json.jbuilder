json.extract! reclamo, :id, :user_id_id, :empresa_id, :texto, :created_at, :updated_at
json.url reclamo_url(reclamo, format: :json)