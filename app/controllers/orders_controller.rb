class OrdersController < ApplicationController
  before_action :set_orders, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Orders.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @orders = Orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @orders = Orders.new(orders_params)

    respond_to do |format|
      if @orders.save
        format.html { redirect_to @orders, notice: 'Orders was successfully created.' }
        format.json { render :show, status: :created, location: @orders }
      else
        format.html { render :new }
        format.json { render json: @orders.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @orders.update(orders_params)
        format.html { redirect_to @orders, notice: 'Orders was successfully updated.' }
        format.json { render :show, status: :ok, location: @orders }
      else
        format.html { render :edit }
        format.json { render json: @orders.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @orders.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Orders was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orders
      @orders = Orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orders_params
      params.require(:orders).permit(:date_submitted, :customer_id, :status, :subtotal, :shipping, :tax, :total)
    end
end
