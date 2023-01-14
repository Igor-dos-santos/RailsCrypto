class CryptoDbsController < ApplicationController
  before_action :set_crypto_db, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!
  #before_action :corect_user, only: %i[ show edit update destroy ]
  # GET /crypto_dbs or /crypto_dbs.json
  def index
    @crypto_dbs = CryptoDb.all
    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=cf06a54c-413a-4cd6-9576-4681d376a3c2&start=1&limit=5000&convert=USD'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri) #this line gets the response from the web
    @lookup_crypto = JSON.parse(@response) #this line parses it and converts to ruby

  end

  # GET /crypto_dbs/1 or /crypto_dbs/1.json
  def show
  end

  # GET /crypto_dbs/new
  def new
    @crypto_db = CryptoDb.new
  end

  # GET /crypto_dbs/1/edit
  def edit
  end

  # POST /crypto_dbs or /crypto_dbs.json
  def create
    @crypto_db = CryptoDb.new(crypto_db_params)

    respond_to do |format|
      if @crypto_db.save
        format.html { redirect_to crypto_db_url(@crypto_db), notice: "Crypto db was successfully created." }
        format.json { render :show, status: :created, location: @crypto_db }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crypto_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crypto_dbs/1 or /crypto_dbs/1.json
  def update
    respond_to do |format|
      if @crypto_db.update(crypto_db_params)
        format.html { redirect_to crypto_db_url(@crypto_db), notice: "Crypto db was successfully updated." }
        format.json { render :show, status: :ok, location: @crypto_db }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crypto_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crypto_dbs/1 or /crypto_dbs/1.json
  def destroy
    @crypto_db.destroy

    respond_to do |format|
      format.html { redirect_to crypto_dbs_url, notice: "Crypto db was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crypto_db
      @crypto_db = CryptoDb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crypto_db_params
      params.require(:crypto_db).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end


    def correct_user
    @correct_user = current_user.crypto_db.find_by(id: params[:id])
    redirect_to crypto_db_path, notice: "Not authororized to edit this entry" if @correct.nil?
    end


  end
