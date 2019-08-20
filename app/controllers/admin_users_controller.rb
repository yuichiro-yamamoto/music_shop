class AdminUsersController < ApplicationController

	def index
	end

	def edit
		@user = EndUser.find(params[:id])
		@addresses = @user.addresses
	end

	def update
		user = EndUser.find(params[:id])
		addresses = user.addresses
		user.update(end_user_params)
		addresses.update(address_params)
		redirect_to admin_users_path
	end

	def destroy
	end

	def search
	end

	private
		def end_user_params
			params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :usually_payment)
		end
		def address_params
			params.require(:address).permit(:postal_code, :address, :telephone_number)
		end
end
