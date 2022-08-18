first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/id/1/200/300', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://picsum.photos/id/2/200/300', bio: 'Teacher from Poland.')
(1..4).each do |i|
    Post.create(author: first_user, title: "Hello ##{i}", text: "This is my post #{i}")
end
first_post = Post.first
(1..6).each do |i|
    Comment.create(post: first_post, author: second_user, text: "comment #{i}" )
end