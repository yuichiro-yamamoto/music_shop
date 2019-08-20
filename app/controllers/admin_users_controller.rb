class AdminUsersController < ApplicationController
  def index
    @users = EndUser.all
  end
end
