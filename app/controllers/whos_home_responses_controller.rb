class WhosHomeResponsesController < ApplicationController
  before_action :set_whos_home_response, only: [:show, :edit, :update, :destroy]

  # GET /whos_home_responses
  # GET /whos_home_responses.json
  def index
    @whos_home_responses = WhosHomeResponse.all
  end

  # GET /whos_home_responses/1
  # GET /whos_home_responses/1.json
  def show
  end

  # GET /whos_home_responses/new
  def new
    @whos_home_response = WhosHomeResponse.new
  end

  # GET /whos_home_responses/1/edit
  def edit
  end

  # POST /whos_home_responses
  # POST /whos_home_responses.json
  def create
    @whos_home_response = WhosHomeResponse.new(whos_home_response_params)

    respond_to do |format|
      if @whos_home_response.save
        format.html { redirect_to @whos_home_response, notice: 'Whos home response was successfully created.' }
        format.json { render action: 'show', status: :created, location: @whos_home_response }
      else
        format.html { render action: 'new' }
        format.json { render json: @whos_home_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whos_home_responses/1
  # PATCH/PUT /whos_home_responses/1.json
  def update
    respond_to do |format|
      if @whos_home_response.update(whos_home_response_params)
        format.html { redirect_to @whos_home_response, notice: 'Whos home response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @whos_home_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whos_home_responses/1
  # DELETE /whos_home_responses/1.json
  def destroy
    @whos_home_response.destroy
    respond_to do |format|
      format.html { redirect_to whos_home_responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whos_home_response
      @whos_home_response = WhosHomeResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whos_home_response_params
      params.require(:whos_home_response).permit(:whos_home_request_id, :user_id, :is_home)
    end
end
