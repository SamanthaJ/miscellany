class User < ActiveRecord::Base
  has_many :posts
  has_many :products
  has_many :tasks
  has_many :facts
  has_many :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
