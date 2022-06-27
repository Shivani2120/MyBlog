module Authors
  class ElementsController < AuthorsController
  
    def create
      @post = current_author.posts.find(params[:post_id])
      @element = @post.elements.build(element_params)
  
        if @element.save
          notice = nil
        else
          notice =  @element.errors.full_messages.join(". ")<<"."
        end
        redirect_to edit_post_path(@post), notice: notice
    end
  
    # PATCH/PUT /elements/1 or /elements/1.json
    def update
      @post = current_author.posts.find(params[:post_id])
      @element = @post.elements.find(params[:id])
        @element.update(element_params)
        redirect_to edit_post_path(@element.post)
    end
  
    # DELETE /elements/1 or /elements/1.json
    def destroy
      @post = current_author.posts.find(params[:post_id])
      @element = @post.elements.find(params[:id])
      @element.destroy
  
      respond_to do |format|
        format.html { redirect_to elements_url, notice: "Element was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
  
      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :content)
      end
  end
end

