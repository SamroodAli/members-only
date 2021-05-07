class PostsController < ApplicationController
   before_action :set_post, only: %i[ show edit update destroy ]
   before_action :authenticate_user!, only: %i[new edit]

  # GET /post or /post.json
  def index
    @posts = Post.all
  end

  # GET /post/1 or /post/1.json
  def show
  end

  # GET /post/new
  def new
    @post = Post.new
  end

  # GET /post/1/edit
  def edit
  end

  # POST /post or /post.json
  def create
    @post = Post.new(post_params)
    @post.update(user_id: current_user.id)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post/1 or /post/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post/1 or /post/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to post_url, notice: "post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
