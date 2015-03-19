class Blog
	def initialize
	@posts = []
	end

	def add(post)
    @posts.push(post)
  	end

	def front_page
	@posts.each do |n| 
	    print n
	end
	end
end


class Post 
	attr_reader(:title, :time, :text)

	def initialize(title, time, text)
		@title = title
		@time = time
		@text = text
	end

# 	def show
# 		return"#{@posts}"
# 	end

	def to_s
		return "#{@title}$$$$$$$, #{@time}$$$$$$$, #{@text}$$$$$$$$"
	end

end

post_1 = Post.new("Cars", "3:30","BMW")
post_2 = Post.new("Planes", "4:30","G6")
post_3 = Post.new("Boats", "5:30","canoe")
blog = Blog.new
blog.add(post_1)
blog.front_page






