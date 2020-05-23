class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #deviseの後ろの：で始まる部分がdeviseの機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Bookモデルと1:Nの関係を記述
  has_many :books, dependent: :destroy

  # image_idを持たせたUserモデルにattachmentメソッドを持たせる
  attachment :profile_image #(idは含めない)

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end
