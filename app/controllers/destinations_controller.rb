class DestinationsController < ApplicationController
    def index

    end

    def show
        # Find the destination by the id and set it equal to @destination
        @destination = Destination.find(params[:id])
        # Find all posts where the destination_id matches that in params[:id]
        # Store it in a @posts instance variable
        
        
        @posts = Post.where("destination_id = ?", params[:id])
        # Collect the last 5 posts written on the destination
        @recent= @posts.last(5)

        #Get the average age of bloggers who wrote about this 
        blogger_count= Blogger.count
        blogger_age_sum= Blogger.sum("age")
        @bloggers=  blogger_age_sum /  blogger_count
       
    end

    def new
        # @destination = Destination.new
    end

    def create
        # @destination = Destination.find_or_create_by(bloggers_params)
        # if @destination.valid?
        #     @destination.save
        #     redirect_to @blogger
        #   else
        #     render :new
        #   end
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