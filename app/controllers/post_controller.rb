class PostController < ApplicationController
 before_action :set_member, only: %i[ show edit update destroy ]

  # GET /post or /post.json
  def index
    @post = Post.all
  end

  # GET /post/1 or /post/1.json
  def show
  end

  # GET /post/new
  def new
    @member = Post.new
  end

  # GET /post/1/edit
  def edit
  end

  # POST /post or /post.json
  def create
    @member = Post.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post/1 or /post/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post/1 or /post/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to post_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:name, :email)
    end
end
