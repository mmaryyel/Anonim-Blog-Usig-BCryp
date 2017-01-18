p = Post.create(title: "Beauty Spa", description: "Places to have a nice haircuts")
t = Tag.create(name: "beauty")
u = User.create(name: "Mauricio", email: "mau@gmail.com", password: "gordita")

#De esta forma le decimos a ActiveRecord que cree la asociación

u.posts << p
p.tags << t




