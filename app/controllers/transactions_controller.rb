class TransactionsController < ApplicationController
  
  # before_action :authenticate_user!
  # before_action :check_cart!

  # Other Code
  

  def create

      
      
      result = Braintree::Transaction.sale(
      :amount => params[:price],
      :payment_method_nonce => params[:payment_method_nonce] ,
      :options => {
      :submit_for_settlement => true
      }
    )
      
    if result.success?
      puts "success!: #{result.transaction.id}"
      reservation = Reservation.find(params[:reservation_id])
      reservation.book = true
      reservation.save
      flash[:notice] = "Transaction Succeed!!"
      redirect_to listing_reservation_path(params[:listing_id],params[:reservation_id])
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
      flash[:notice] = "Transaction Failed!!"
      redirect_to listing_reservation_path(params[:listing_id],params[:reservation_id])
    else
      p result.errors
      flash[:notice] = "Transaction Error!!"
      redirect_to listing_reservation_path(params[:listing_id],params[:reservation_id])
    end

  end



end
