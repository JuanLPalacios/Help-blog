require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'User post index page' do
    before(:example) { visit user_posts_path(1) }
    before(:all) do
      @user = User.find(1)
    end
    it "I can see the user's profile picture." do
      expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    end
    it "I can see the user's username." do
      expect(page).to have_content(@user.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end
    it "I can see a post's title." do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        expect(page).to have_content(post.title)
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it "I can see some of the post's body." do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        expect(page).to have_content(post.text[0..100])
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it 'I can see the first comments on a post.' do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        first_comment = post.comments.order(created_at: :desc).first
        expect(page).to have_content(first_comment.text) unless first_comment.nil?
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it 'I can see how many comments a post has.' do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        expect(page).to have_content("Comments: #{post.comments_counter}")
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it 'I can see how many likes a post has.' do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        expect(page).to have_content("Likes: #{post.likes_counter}")
        visit user_posts_path(1, page: (index / 2) + 2) if index.odd?
      end
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_xpath("//section[@id='pagination']")
    end
    it "When I click on a post, it redirects me to that post's show page." do
      @user.posts.order(id: :desc).each_with_index do |post, index|
        visit user_posts_path(1, page: (index / 2) + 1)
        find(:xpath, "//a[@href='/users/#{@user.id}/posts/#{post.id}']").click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{post.id}")
      end
    end
  end

  describe 'Post show page' do
    before(:example) do
      @post_one = Post.find_by(id: 1)
      @user_one = @post_one.author
      visit user_post_path(@user_one, @post_one)
    end

    before(:all) do
      @post = Post.find_by(id: 1)
      @user = @post.author
    end
    it "I can see the post's title." do
      expect(page).to have_content(@post.title)
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content(@user.name)
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end
    it 'I can see how many likes it has.' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end
    it 'I can see the post body.' do
      expect(page).to have_content(@post.text)
    end
    it 'I can see the username of each commentor.' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end
    it 'I can see the comment each commentor left.' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
