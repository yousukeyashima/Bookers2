class UsersController < ApplicationController

	#ログイン済みユーザのみアクセス許可
	before_action :authenticate_user!, except: [:home,:about]
	#サインインしているユーザを取得する
	before_action :correct_user, only: [:edit, :update]

	def home
	end

	def about
	end

	def index
		@book = Book.new
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		#指定したidのユーザーのレコードを取得
		@books = Book.where(user_id: current_user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def correct_user
		@user = User.find(params[:id])
		#サインインしているユーザーでない場合リダイレクト
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end
end
