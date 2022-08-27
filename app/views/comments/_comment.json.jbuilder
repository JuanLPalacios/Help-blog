json.extract! comment, :id, :text, :created_at, :updated_at
json.author do
  json.partial! 'users/user', user: @user
end
