class ApplicationController < ActionController::Base

	#deviseの初期設定では用意されていないnameカラムを追記
	#deviseの機能が利用される前にconfigure_permitted_parametersが実行
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		user_path(resource) #ログイン後に遷移するpathを設定
	end

	def after_sign_out_path_for(resource)
		root_path #ログアウト後に遷移するpathを設定
	end

	protected #protectedは呼び出された他のコントローラからも参照可能
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) #sign_upの際に、name,emailのデータ操作許可
	end
end
