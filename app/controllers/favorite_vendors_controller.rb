class FavoriteVendorsController < ApplicationController
        before_action :set_vendor
        
        def create
          if Favorite.create(favorited: @vendor, user: current_user)
            redirect_to @vendor, notice: 'vendor has been favorited'
          else
            redirect_to @vendor, alert: 'Something went wrong...*sad panda*'
          end
        end
        
        def destroy
          Favorite.where(favorited_id: @vendor.id, user_id: current_user.id).first.destroy
          redirect_to @vendor, notice: 'vendor is no longer in favorites'
        end
        
        private
        
        def set_vendor
          @vendor = Vendor.find(params[:vendor_id] || params[:id])
        end

end
