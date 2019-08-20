class EndAddressesController < ApplicationController

	def new 
		@user = Address.new
	end

	def create
		#puts '---------------------------------'
        user = Address.new(address_params)
        #puts user.inspect
        user["end_user_id"] = current_end_user["id"]
        user["main_flag"] = false
        #puts user.inspect
        user.save
        redirect_to end_user_path(current_end_user.id)
        #logger.debug user.errors.inspect
	end

	def destroy
		user = Address.find(params[:id])
		user.destroy
		redirect_to end_user_path
	end


	private
	def address_params
		params.require(:address).permit(:name, :postal_code, :address, :telephone_number)

	end
end
