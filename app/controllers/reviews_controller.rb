class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Reviews.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @reviews = Reviews.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @reviews = Reviews.new(reviews_params)

    respond_to do |format|
      if @reviews.save
        format.html { redirect_to @reviews, notice: 'Reviews was successfully created.' }
        format.json { render :show, status: :created, location: @reviews }
      else
        format.html { render :new }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @reviews.update(reviews_params)
        format.html { redirect_to @reviews, notice: 'Reviews was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviews }
      else
        format.html { render :edit }
        format.json { render json: @reviews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @reviews.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Reviews was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviews
      @reviews = Reviews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviews_params
      params.require(:reviews).permit(:title, :body, :rating, :state, :customer_id, :book_id)
    end
end
