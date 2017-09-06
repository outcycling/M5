class GratitudesController < ApplicationController
  before_action :set_gratitude, only: [:show, :edit, :update, :destroy]

  # GET /gratitudes
  # GET /gratitudes.json
  def index
    @gratitudes = Gratitude.all
    readings = Reading.all
    @first_reading = readings.first
  end

  # GET /gratitudes/1
  # GET /gratitudes/1.json
  def show
  end

  # GET /gratitudes/new
  def new
    @gratitude = Gratitude.new
  end

  # GET /gratitudes/1/edit
  def edit
  end

  # POST /gratitudes
  # POST /gratitudes.json
  def create
    @gratitude = Gratitude.new(gratitude_params)

    respond_to do |format|
      if @gratitude.save
        
        save_gratitudes
          
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @gratitude }
      else
        format.html { render :new }
        format.json { render json: @gratitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gratitudes/1
  # PATCH/PUT /gratitudes/1.json
  def update
    respond_to do |format|
      if @gratitude.update(gratitude_params)
        format.html { redirect_to @gratitude, notice: 'Gratitude was successfully updated.' }
        format.json { render :show, status: :ok, location: @gratitude }
      else
        format.html { render :edit }
        format.json { render json: @gratitude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gratitudes/1
  # DELETE /gratitudes/1.json
  def destroy
    @gratitude.destroy
    respond_to do |format|
      format.html { redirect_to gratitudes_url, notice: 'Gratitude was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gratitude
      @gratitude = Gratitude.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gratitude_params
      params.require(:gratitude).permit(:user_id, :entry)
    end
    
    def  save_gratitudes
        unless params[:entry2].strip == ""
            Gratitude.create(user_id: current_user.id, entry: params[:entry2])  
        end
        
        unless params[:entry3].strip == ""
            Gratitude.create(user_id: current_user.id, entry: params[:entry3])  
        end
    end
end
