class MyfriendsController < ApplicationController
  before_action :set_myfriend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /myfriends or /myfriends.json
  def index
    @myfriends = Myfriend.all

  end

  # GET /myfriends/1 or /myfriends/1.json
  def show
  end

  # GET /myfriends/new
  def new
    #@myfriend = Myfriend.new
    @myfriend = current_user.myfriends.build
  end

  # GET /myfriends/1/edit
  def edit
  end

  # POST /myfriends or /myfriends.json
  def create
    #@myfriend = Myfriend.new(myfriend_params)
    @myfriend = current_user.myfriends.build(myfriend_params)
    respond_to do |format|
      if @myfriend.save
        format.html { redirect_to myfriend_url(@myfriend), notice: "Myfriend was successfully created." }
        format.json { render :show, status: :created, location: @myfriend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @myfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myfriends/1 or /myfriends/1.json
  def update
    respond_to do |format|
      if @myfriend.update(myfriend_params)
        format.html { redirect_to myfriend_url(@myfriend), notice: "Myfriend was successfully updated." }
        format.json { render :show, status: :ok, location: @myfriend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @myfriend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myfriends/1 or /myfriends/1.json
  def destroy
    @myfriend.destroy

    respond_to do |format|
      format.html { redirect_to myfriends_url, notice: "Myfriend was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  
  def correct_user
    @myfriend = current_user.myfriends.find_by(id: params[:id])
    redirect_to myfriends_path, notice: "Not Authorized To Edit This Friend" if @myfriend.nil?
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myfriend
      @myfriend = Myfriend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def myfriend_params
      params.require(:myfriend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
