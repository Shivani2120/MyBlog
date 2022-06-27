module Authors
    class PostsController < AuthorsController
        before_action :authenticate_author!

        def index
            @posts = current_author.posts
        end

        def edit
            @post = current_author.posts.find(params[:id])
            @paragraph = @post.elements.build(element_type: "paragraph")
        end

        def new
            @post = current_author.posts.build
        end

        def Show
            @post = current_author.posts.find(params[:id])
        end

        def create
            @post = current_author.posts.build(post_params)
            @post.save

            redirect_to @post
            
        end

        def update
            @post = current_author.posts.find(params[:id])
            @post.update(post_params)

            redirect_to @post
        
        end

        def distroy
            @post = current_author.posts.find(params[:id])
            @post.destroy

            redirect_to @post
        end

        private
        def post_params
            params.require(:post).permit(:title, :description, :published, :published_at, :author_id)
        end
    end
end
