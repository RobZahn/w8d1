class PostsController < ApplicationController
    
    before_action, :require_signed_in!, only: [:new, :create, :edit, :update, :destroy]
    before_action, :is_authored_post!

    def new 
        @post = Post.new
        render :new 
    end

    def create 
        @post = Post.create(post_params)
        if @post.save 
            redirect_to post_url(@post)
        else  
            flash.now[:errors] = @post.errors.full_messages 
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit 
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.update(post_params)
        
        if @post.save
            redirect_to posts_url
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy 
        @post = current_user.posts.find_by(id: params[:id]) 
        if @post && @post.destroy 
        end
        redirect_to users_url
    end

    private 
    def post_params 
        params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
    end

    def is_authored_post! 
        current_user.posts.find_by(id: params[:id]) 
    end

end
