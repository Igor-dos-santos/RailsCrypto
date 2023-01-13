class CryptoDbsController < ApplicationController
  before_action :set_crypto_db, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  # GET /crypto_dbs or /crypto_dbs.json
  def index
    @crypto_dbs = CryptoDb.all
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
      params.require(:crypto_db).permit(:symbol, :user_integer, :cost_per, :amount_owned)
    end
end
