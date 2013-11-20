class WhosHomeRequestsController < ApplicationController
  before_action :set_whos_home_request, only: [:show, :edit, :update, :destroy]

  # GET /whos_home_requests
  # GET /whos_home_requests.json
  def index
    @whos_home_requests = WhosHomeRequest.all
  end

  # GET /whos_home_requests/1
  # GET /whos_home_requests/1.json
  def show
  end

  # GET /whos_home_requests/new
  def new
    @whos_home_request = WhosHomeRequest.new
  end

  # GET /whos_home_requests/1/edit
  def edit
  end

  # POST /whos_home_requests
  # POST /whos_home_requests.json
  def create
    @whos_home_request = WhosHomeRequest.new(whos_home_request_params)

    respond_to do |format|
      if @whos_home_request.save
        format.html { redirect_to @whos_home_request, notice: 'Whos home request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @whos_home_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @whos_home_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whos_home_requests/1
  # PATCH/PUT /whos_home_requests/1.json
  def update
    respond_to do |format|
      if @whos_home_request.update(whos_home_request_params)
        format.html { redirect_to @whos_home_request, notice: 'Whos home request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @whos_home_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whos_home_requests/1
  # DELETE /whos_home_requests/1.json
  def destroy
    @whos_home_request.destroy
    respond_to do |format|
      format.html { redirect_to whos_home_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whos_home_request
      @whos_home_request = WhosHomeRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whos_home_request_params
      params.require(:whos_home_request).permit(:user_id, :num_recipients)
    end
end
