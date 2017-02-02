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
  puts "*" * 20
  puts "INSIDE POST"
  p params[:post]
  puts "*" * 20
  params[:post].each do |key, value|
    p tag = Tag.find_by(name: value)
    if tag
      puts "*" * 20
      puts "INSIDE IF"
      unless post.tags.include?(tag)
        post.tags << tag
      end
      if key != value
        old_tag = Tag.find_by(name: key)
        post.tags.delete(old_tag)
      end
    else
      puts "*" * 20
      puts "INSIDE ELSE"
      t = Tag.create(name: value)
      post.tags << t
      old_tag = Tag.find_by(name: key)
      p post.tags
      post.tags.delete(old_tag)
      p post.tags
    end
  end
  redirect to("/posts/#{post.id}")
end

#ELIMINA EL POST

post '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.delete
end
