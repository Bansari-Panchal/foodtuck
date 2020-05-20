class VendorsController < ApplicationController
  autocomplete :city, :name,:full => true
  def index
    if params[:search]
      @vendors = Vendor.search(params[:search]).order("created_at DESC")
    else
      @vendors = Vendor.all.order('created_at DESC')
    end
  end
          
    def show
      @vendor = Vendor.find(params[:id])
    end
          
    def new

      @vendor = Vendor.new
      @vendor.build_tax
    end
          
    def edit
      @vendor = Vendor.find(params[:id])
    end
          
    def create
      @vendor = Vendor.new(vendor_params)
      if @vendor.save
        redirect_to vendors_path
      else
        render 'new'
      end
    end
          
    def update
      @vendor = Vendor.find(params[:id])
          
      if @vendor.update(vendor_params)
        redirect_to @vendor
      else
        render 'edit'
      end
    end
          
    def destroy
      @vendor = Vendor.find(params[:id])
      @vendor.destroy
             
      redirect_to vendors_path
    end

    def search_city 
      @find = City.where('name LIKE ?', "%#{params[:q]}%")
      render json: @find
    end

    private
    def vendor_params
      params.require(:vendor).permit(:name,:tagline,:description,:featured_image,:order_fulfillment_time_in_minutes,:price_point,:city,:category_ids => [],tax_attributes: [:desc,:amount,:is_percentage,:terms]).merge(user_id: current_user.id)
    end
          
         
end
#