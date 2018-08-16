json.extract! render_scaffold, :id, :titulo, :contenido, :user_id, :created_at, :updated_at
json.url render_scaffold_url(render_scaffold, format: :json)
