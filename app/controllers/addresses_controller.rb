class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update destroy]
  before_action :authenticate_customer!

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = current_customer.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show; end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit; end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = current_customer.addresses.build(
      province:           Province.find(params[:province_id].to_i),
      country_code:       params[:country_code],
      is_primary_address: address_params[:is_primary_address].to_i == 1,
      address_line_one:   address_params[:address_line_one],
      address_line_two:   address_params[:address_line_two],
      address_additional: address_params[:address_additional],
      city:               address_params[:city],
      postal_code:        address_params[:postal_code]
    )

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_params
    params.require(:address).permit(:province_id, :country_code, :is_primary_address, :address_line_one, :address_line_two, :address_additional, :city, :postal_code, :address, {})
  end
end
