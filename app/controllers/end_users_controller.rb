class EndUsersController < ApplicationController

	def show

	end

	def unsubscribe
    
  end

	def edit
		@user = EndUser.find(params[:id])
		@address = Address.find(params[:id])
	end

	def update
		user = EndUser.find(params[:id])
		address = Address.find(params[:id])
		user.update(end_user_params)
		address.update(address_params)
		redirect_to root_path
	end

	def delete
		if delete = EndUser.find_by(email:params[:delete_email])
			if current_end_user.id == delete.id
				current_end_user.delete_flag = true
				redirect_to destroy_end_user_session_path, method: :delete
			end
		end
			redirect_to end_item_path(36)
			# 後で書き換えます
	end

	private
		def end_user_params
			params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :usually_payment)
		end
		def address_params
			params.require(:address).permit(:postal_code, :address, :telephone_number)
		end
  
end
