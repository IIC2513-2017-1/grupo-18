class CommentsController < ApplicationController

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.content ='Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate'
    respond_to do |format|
      if @comment.save
        format.html { redirect_to bet_path(@comment.bet)}
        format.js
      else
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
	  redirect_to bet_path(@comment.bet)
    else
      redirect_to :back
    end
  end

  # DELETE /comments/1
  def destroy
  	this_bet = @comment.bet

    @comment.destroy

    redirect_to bet_path(this_bet)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :bet_id, :user_id)
    end
end
