class Book < ApplicationRecord
	#Userモデルと関連付ける
	belongs_to :user

	validates :body, :title, presence: true
	validates :body, length: {maximum: 200}
end
