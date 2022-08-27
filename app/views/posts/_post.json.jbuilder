json.extract! post, :id, :title, :text, :likes_counter, :comments_counter, :created_at, :updated_at
json.comments(post.comments) do |comment|
  json.partial! 'comments/comment', comment: comment
end
json.url user_post_url(post.author, post, format: :json)
