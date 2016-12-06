class ListingsController < ApplicationController

 

  def index
    # byebug

    @listings = Listing.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 10)
   
   
  end

  def new

      allowed?(current_user ,current_user)
     

  end

  def create
    
    listing = Listing.create(params[:listing])
   
    # listing.description = params[:listing][:description]
    
    # listing.address = params[:listing][:address]
    
    # listing.price = params[:listing][:price]
    
    # listing.user_id =  params[:listing][:user_id]
    
    # listing.save

   redirect_to listing

  end


  def upload
    @new_listing = Listing.find(params[:id])

    render "_form"
  end

  def submit_upload

      listing = Listing.find(params[:id])

      listing.update(listing_params)
      redirect_to listing

  end


  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    

    listing = Listing.find(params[:id])
    listing.update(description: params[:listing][:description],address: params[:listing][:address],price: params[:listing][:price])
    # listing.description = params[:listing][:description]
    # listing.address = params[:listing][:address]
    # listing.price = params[:listing][:price]
    # listing.save
     redirect_to listing
  end

  def destroy

    # byebug
    listing = Listing.find(params[:id]).destroy

   
    redirect_to current_user

  end

  def search
    @listings = Listing.search(params[:listing][:search]).paginate(:page => params[:page], :per_page => 10)

    @address = params[:listing][:search]
    render "/listings/index"
  end

  def filter

    
    if params[:location].empty?
      @listings = Listing.where("price >= ? AND price <= ? ",params[:min_price].to_i,params[:max_price].to_i).order("price ASC").paginate(:page => params[:page], :per_page => 10)
    else
    
    @listings = Listing.where("price >= ? AND price <= ? AND address = ? ",params[:min_price].to_i,params[:max_price].to_i,params[:location].capitalize).order("price ASC").paginate(:page => params[:page], :per_page => 10)
    end
   
    render "/listings/index"
  end


  private

  def listing_params
    params.require(:listing).permit(:description, :address, :price, :user_id, {photoes: []})
  end

 


end


