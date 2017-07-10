json.array!(@slide) do |slide|
  json.extract! slide, :id
  json.title slide.title
  json.content slide.caption
end
