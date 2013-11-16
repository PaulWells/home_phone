class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :whos_home]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

	def register
		@user = User.new
		responseHash = ActiveSupport::JSON.decode(request.raw_post)
		userHash = responseHash["user"]
		@user.email = userHash["email"]
		@user.name = userHash["name"]
		@user.phone_number = userHash["phone_number"]
		
		registration_id = userHash["registration_id"]
		registration = Registration.new
		registration.registration_id = "registration_id"
		registration.user_id = @user.id
		
		if registration.save
			logger.debug "registered successfully"
		else
			logger.debug registration.errors
		end
		

		respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

	end
	
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

	def find_user
		phone_number = params[:phone_number]
		logger.debug phone_number
		user = user.find_by phone_number: phone_number
		logger.debug user.inspect
		respond_to do |format|
      format.html { redirect_to users_url }
      format.json { render json: user } 
    end
	end

	def whos_home

		require "net/http"
		require "uri"


		house = House.find(params[:house_id].to_i)
		residents = house.users
		#:residents.delete(@user)
		registration_ids = Array.new
		house.users.each do |user|
			registration_ids.push user.registration_ids
		end

		uri = URI.parse("https://android.googleapis.com/gcm/send")
		data = GcmData.new
		data.requestor_id = @user.id
		data.house_id = house.id
		body = GcmPollIsHome.new
		body.data = data
		body.registration_ids = registration_ids
		body.time_to_live = 10
		body.dry_run = false
		logger.debug body.inspect

		request = Net::HTTP::Post.new(uri)
		request.body = body.to_json
		request["Authorization"] = "key=AIzaSyC02YIATAVSO-SIB562TIgkD3FmJLM7vuI"
		request["Content-Type"] = "application/json"

		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		response = http.request(request)
	
		case response
		when Net::HTTPSuccess, Net::HTTPRedirection
			logger.debug "successful network call"
			logger.debug response.body.inspect
		else
			logger.debug response.value
		end

		respond_to do |format|
      format.html { redirect_to users_url }
      format.json { render json: response.body} 
    end
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:phone_number, :name, :email)
    end
end
