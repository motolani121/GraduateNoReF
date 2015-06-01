json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :image_url, :email
  json.url post_url(post, format: :json)
end
