class PostsController < ApplicationController
  def index
  	@posts = Post.all  
  end

  def new
  	@post= Post.new
  end

  def create
  	post=Post.new(post_params)
  	post.save
  	redirect_to  posts_path
  end
  def edit 
  	@post = Post.find(params[:id])
  end
  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to posts_path

  end
  def destroy
  	post=Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path

  end

  def show
    @post=Post.find(params[:id])
    @comments=@post.comments.all
  end

   private

   def post_params
   	params.require(:post).permit(:id,:title,:content)
   end

end
