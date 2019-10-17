json.array! @articles do |article|
  json.title article.title
  json.body article.body
  json.id article.id
end