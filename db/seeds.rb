# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

### Users ###
first_user = User.create(
  'name' => 'Michael Smith',
  'photo' => 'https://i.pravatar.cc/150?img=3',
  'bio' => 'Michael is a distinguished historian specializing in medieval Europe. Born in London in 1978, he developed an interest in history at a young age. He earned his Ph.D. in Medieval Studies from Oxford University and has since published several acclaimed books on the Crusades. Michael is also known for his engaging lectures and commitment to making history accessible to a wider audience.')

second_user = User.create(
  'name' => 'Sarah Patel',
  'photo' => 'https://i.pravatar.cc/150?img=25',
  'bio' => 'Sarah is an influential software engineer and tech entrepreneur from Mumbai, born in 1982. She co-founded a leading AI startup that revolutionized machine learning applications in healthcare. Sarah is a prominent advocate for women in technology and has been featured in numerous tech conferences as a keynote speaker.')

third_user = User.create(
  'name' => 'Nina Nguyen',
  'photo' => 'https://i.pravatar.cc/150?img=20',
  'bio' => 'Nina is a Vietnamese-American film director born in 1976 in Ho Chi Minh City. She moved to Los Angeles as a child and later attended NYU\'s Tisch School of the Arts. Her films, known for their powerful storytelling and visual artistry, have won multiple awards at international film festivals.')

fourth_user = User.create(
  'name' => 'Emma Johnson',
  'photo' => 'https://i.pravatar.cc/150?img=47',
  'bio' => 'Emma is a Canadian environmental scientist born in Toronto in 1985. Her groundbreaking research on climate change and its impact on Arctic ecosystems has been widely recognized. Emma is an advocate for sustainable practices and has worked with various NGOs to promote environmental awareness and policy change.')


### Posts ###
first_post = Post.create(author: first_user, 'title' => 'Post 1', 'text' => 'This is the text of post 1')
second_post = Post.create(author: second_user, 'title' => 'Post 2', 'text' => 'This is the text of post 2')
third_post = Post.create(author: third_user, 'title' => 'Post 3', 'text' => 'This is the text of post 3')
fourth_post = Post.create(author: fourth_user, 'title' => 'Post 4', 'text' => 'This is the text of post 4')
fifth_post = Post.create(author: first_user, 'title' => 'Post 5', 'text' => 'This is the text of post 5')
sixth_post = Post.create(author: first_user, 'title' => 'Post 6', 'text' => 'This is the text of post 6')
seventh_post = Post.create(author: first_user, 'title' => 'Post 7', 'text' => 'This is the text of post 7')
eighth_post = Post.create(author: first_user, 'title' => 'Post 8', 'text' => 'This is the text of post 8')
nineth_post = Post.create(author: first_user, 'title' => 'Post 9', 'text' => 'This is the text of post 9')

### Comments ###
first_comment = Comment.create(user: first_user, post: second_post, 'text' => 'This is the text of comment 1')
second_comment = Comment.create(user: second_user, post: third_post, 'text' => 'This is the text of comment 2')
third_comment = Comment.create(user: third_user, post: first_post, 'text' => 'This is the text of comment 3')
fourth_comment = Comment.create(user: fourth_user, post: first_post, 'text' => 'This is the text of comment 4')
fifth_comment = Comment.create(user: first_user, post: second_post, 'text' => 'This is the text of comment 5')
sixth_comment = Comment.create(user: second_user, post: third_post, 'text' => 'This is the text of comment 6')

### Likes ###
first_like = Like.create(user: first_user, post: third_post)
second_like = Like.create(user: second_user, post: first_post)
third_like = Like.create(user: third_user, post: second_post)
fourth_like = Like.create(user: fourth_user, post: fourth_post)