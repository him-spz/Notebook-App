json.extract! notebook, :id, :name, :description, :user_id, :created_at, :updated_at
json.url notebook_url(notebook, format: :json)
