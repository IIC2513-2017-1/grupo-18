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
    # respond_to do |format|
      @comment.save
      redirect_to :back
      # format.html { redirect_to bet_path(Bet.find_by(id: @comment.bet_id)), notice: 'Comment was successfully created.' }
    # end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
		format.html { redirect_to bet_path(Bet.find_by(id: @comment.bet_id)) }
	  else
	  	format.html { render :edit }
      end
    end
  end

  # DELETE /comments/1
  def destroy
  	this_bet = Bet.find_by(id: @comment.bet_id)

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
