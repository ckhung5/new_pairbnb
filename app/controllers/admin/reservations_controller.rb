class Admin::ReservationsController < ApplicationController

  def index

      @reservations = Reservation.paginate(:page => params[:page], :per_page => 30)

  end

  # def create

  #     @reservation = Reservation.new
  #     @reservation.user_id = params[:user_id]
  #     @reservation.listing_id = params[:listing_id]
  #     @reservation.start_date = params[:start_date]
  #     @reservation.start_date = params[:end_date]

  # end


  # def new
  # end


  # def edit
  # end


  # def show

  #     @reservation = Reservation.find(params[:id])

  # end

  # def update
  # end

  # def destroy
  # end













end
