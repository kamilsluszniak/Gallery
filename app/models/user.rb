class User < ApplicationRecord
  has_many :drawings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  def active_for_authentication? 
    super && approved?
  end 

  def inactive_message 
    if !confirmed? && !approved?
      :not_confirmed_nor_approved
    elsif !approved?
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
  
  def approve!
    update_attribute(:approved, true)
  end
end
