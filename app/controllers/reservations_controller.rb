class ReservationsController < ApplicationController

  def index
  
      # @reservations = Reservation.where(:user_id => current_user.id)
      # @user = User.find(current_user.id)
      @listings = Listing.where(user_id: current_user.id)


  end

  def create
      # byebug
      #find user id
      listing = Listing.find(params[:listing_id])
    

      reservation = Reservation.new
      reservation.user_id = current_user.id
      reservation.listing_id = params[:reservation][:listing_id]
      reservation.start_date = params[:reservation][:start_date]
      reservation.end_date = params[:reservation][:end_date]
      # byebug
      if reservation.save
      
      ReservationMailer.booking_email(current_user,listing.user,reservation.id).deliver_later
      # ReservationJob.perform_later(current_user,listing.user,reservation.id).deliver_later
      redirect_to listing_reservation_path(listing.id,reservation.id)
      # redirect_to new_transaction_path

      else
 
      # flash.now.notice = "Invalid date"
      redirect_to new_listing_reservation_path(params[:listing_id])
      end
  end


  def new
  

    @listing = Listing.find(params[:listing_id])

  end


  def edit
  end


  def show

      @reservation = Reservation.find(params[:id])
      gon.client_token = generate_client_token

  end

  def update
  end

  def destroy

    # byebug
    Reservation.find(params[:id]).destroy

    redirect_to listing_reservations_path(params[:listing_id])

  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end













end
