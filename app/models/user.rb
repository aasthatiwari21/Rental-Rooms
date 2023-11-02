class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	belongs_to :role
	has_many :properties, dependent: :destroy
	has_many :reviews,dependent: :destroy
 	validates :email, uniqueness: true
 validates :contact,presence:true,numericality: true,length:{minimum: 10,  too_short: 'should   be atleast %{count} digits'}
  def seeker?
    role=="Seeker"
  end
  def owner?
    role =="Owner"
  end
  def broker?
    role =="Broker"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "contact", "created_at", "email", "encrypted_password", "id", "name", "password", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role_id", "updated_at", "username"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["properties", "reviews", "role"]
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 1.day.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
 


end