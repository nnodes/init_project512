json.array!(@page) do |page|
  json.extract! page, :id
  json.title page.title
  json.content page.content
  json.url page.url
end
