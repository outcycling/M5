class User < ApplicationRecord
    
    has_many :pictures, :dependent => :destroy
    has_many :writings, :dependent => :destroy
    has_many :gratitudes, :dependent => :destroy
    
    has_many :managedphotos, :dependent => :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ManagePhoto'
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
