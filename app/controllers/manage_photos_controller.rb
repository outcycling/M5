class ManagePhotosController < ApplicationController
  before_action :set_manage_photo, only: [:show, :edit, :update, :destroy]

  # GET /manage_photos
  # GET /manage_photos.json
  def index
    @manage_photos = ManagePhoto.all
  end

  # GET /manage_photos/1
  # GET /manage_photos/1.json
  def show
  end

  # GET /manage_photos/new
  def new
    @manage_photo = ManagePhoto.new
  end

  # GET /manage_photos/1/edit
  def edit
  end

  # POST /manage_photos
  # POST /manage_photos.json
  def create
    @manage_photo = ManagePhoto.new(manage_photo_params)

    respond_to do |format|
      if @manage_photo.save
        format.html { redirect_to @manage_photo, notice: 'Manage photo was successfully created.' }
        format.json { render :show, status: :created, location: @manage_photo }
      else
        format.html { render :new }
        format.json { render json: @manage_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage_photos/1
  # PATCH/PUT /manage_photos/1.json
  def update
    respond_to do |format|
      if @manage_photo.update(manage_photo_params)
        format.html { redirect_to @manage_photo, notice: 'Manage photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_photo }
      else
        format.html { render :edit }
        format.json { render json: @manage_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage_photos/1
  # DELETE /manage_photos/1.json
  def destroy
    @manage_photo.destroy
    respond_to do |format|
      format.html { redirect_to manage_photos_url, notice: 'Manage photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_photo
      @manage_photo = ManagePhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_photo_params
      params.require(:manage_photo).permit(:requestor_id, :requestee_id, :granted)
    end
end
