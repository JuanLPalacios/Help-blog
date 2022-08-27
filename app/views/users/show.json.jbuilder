json.partial! 'users/user', user: @user
json.most_recent_posts(@user.most_recent_posts) do |post|
  json.partial! 'posts/post', post: post
end
