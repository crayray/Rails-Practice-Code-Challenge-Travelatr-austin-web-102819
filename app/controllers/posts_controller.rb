class PostsController < ApplicationController
    def show
        @post= Post.find(params[:id])
        # @author= Blogger.where("id= ?", author_id).name
        # @author = @post.blogger.name
        @author = @post.blogger
        @destination = @post.destination
       
    end

    def new
        @post= Post.new
    end

    def create
        @post= Post.find_or_create_by(posts_params)
        
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
          else
            render :new
          end
    end

    def edit
        @post= Post.find(params[:id])
        
    end

    def update
        @post= Post.find(params[:id])
        @post= Post.update(posts_params)
        redirect_to post_path(@post)
        

    end

    def posts_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end