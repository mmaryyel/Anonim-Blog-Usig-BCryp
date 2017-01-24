post '/create_post' do 
  # Post
  post = Post.create(title: params[:title], description: params[:post])

  # Tag
  tag_list = params[:tags].split
  tag_list.each do |tag|
    find_tag = Tag.find_by(name: tag)
    if find_tag
      post.tags << find_tag
    else
      post.tags << Tag.create(name: tag)
    end
  end

  
  current_user.posts << post
  redirect to("/users/#{current_user.id}")
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end

get '/same_tags/:tag_id' do
  @tag = Tag.find(params[:tag_id])
  @posts = @tag.posts
  erb :same_tags
end

#para editar
get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/:id' do
  post = Post.find(params[:id])
  post_update = post.update(title: params[:title], description: params[:description])
  params[:post].each do |key, value|
    tag = Tag.find_by(name: value)
    if tag
      tag.update(name: value)
    else
      t = Tag.create(name: value)
      post.tags << t
    end
  end
  redirect to("/posts/#{post.id}")
end
