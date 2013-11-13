class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render action: 'show', status: :created, location: @house }
      else
        format.html { render action: 'new' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end
  
  def add_users
		logger.debug "in add_users"
    @house = House.find(params[:id])    
    usersHash = ActiveSupport::JSON.decode(request.raw_post)
    usersArray = usersHash["users"]
    justIDsArray = usersArray.map { |user| user["id"] }
		logger.debug "id array"
		logger.debug justIDsArray.inspect
    users = User.find(justIDsArray)
    logger.debug users.inspect
    
    users.each do |user|
      add_user user
    end
    
    respond_to do |format|
      
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }

    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end
    
    def add_user(user)
      
      residency = Residency.new
      residency.user = user
      residency.house = @house
      if residency.save
				logger.debug "saved"
			else
				logger.debug "not saved"
			end
    end
      
      

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:house_name, :longitude, :latitude, :address, :phone_number)
    end
end
