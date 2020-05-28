class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = Product.all.where(:vendor_id => @vendor.id)
    flash.now[:info] = "This is available items."
  end
        
  def show
    @product = @vendor.products.find(params[:id])
    
  end
        
  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
    @vendor.products.build
    @product.choices.build
  end
        
  def edit
    @product = Product.find(params[:id])
    
  end
        
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.build(product_params)
      if @product.save
        flash.now[:success] = "Item is created sucessfully."
        redirect_to vendor_products_path
      else
        flash.now[:error] = "Item is not created.something is wrong."
        render 'new'
      end
  end
        
  def update
    @product = @vendor.products.find(params[:id])
        
    if @product.update(product_params)
      flash.now[:success] = "Item is updated sucessfully."
      redirect_to vendor_products_path
     else
      flash.now[:error] = "Item is not updated.something is wrong."
      render 'edit'
    end
  end
        
  def destroy
    @product = @vendor.products.find(params[:id])
    @product.destroy
    redirect_to vendor_path(@vendor)
  end
 
   private
    def product_params
          params.require(:product).permit(:vendor_id,:name,:cost_in_dollars,:description,:menu_category,:item_tags,:availability,:popular,:item_image,:is_catering, choices_attributes:[:id, :name, :allow_multiple, :_destroy,options_attributes: [:id, :name, :cost_in_dollars,  :choice_id,:_destroy]])
    end
         
    private

  def set_product
      @vendor = Vendor.find(params[:vendor_id])
  end
             
end
#[:id,:name,:allow_multiple,:_destroy]