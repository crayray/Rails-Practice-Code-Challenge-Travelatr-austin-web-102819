class BloggersController < ApplicationController
    def index

    end

    def show
        @blogger = Blogger.find(params[:id])
        @likes = Post.where("blogger_id = ?", params[:id])
    

    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.find_or_create_by(bloggers_params)
        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
          else
            render :new
          end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    
    def bloggers_params
        params.require(:blogger).permit(:age, :name, :bio)
    end
end