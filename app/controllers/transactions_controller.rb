class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
      @transaction = Transaction.new
      @service = Service.find(params[:service])
      @company = Company.find(@service.company_id)
      @userProfile = UserProfile.find_by(user_id:current_user.id) || UserProfile.new(user_id: current_user.id)
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create

    @transaction = Transaction.new(transaction_params)
    @transaction.service_id = params["service_id"]
    @transaction.company_id = params["company_id"]
    @user = current_user
    @transaction.user_id = @user.id
    @userProfile = UserProfile.find_by(user_id:current_user.id) || UserProfile.new(user_id: current_user.id)
    if @userProfile.id
      @userProfile.update_attributes(user_profile_params)
    else
      @userProfile = UserProfile.new(user_profile_params)
      @userProfile.user_id = @user.id
      @userProfile.save
    end
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to my_account_index_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        raise params.to_s + ' ' +@transaction.errors.full_messages.to_s
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to my_account_index_path, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:firstname, :lastname, :middlename, :phone, :address1, :address2, :city, :province, :postal_code, :country)
      #params[:transaction]
    end

    def transaction_params
      params[:transaction]
    end
end
