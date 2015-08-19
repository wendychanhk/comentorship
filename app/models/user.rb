class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    before_save { self.email = email.downcase }

    has_and_belongs_to_many :skills 
    has_and_belongs_to_many :wanteds

    has_many :sent_messages, :foreign_key => "sender_id", class_name: "Message"
    has_many :received_messages,:foreign_key => "receiver_id", class_name: "Message"



  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }



    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :city, presence: true, length: { maximum: 50 }
    validates :country, presence: true, length: { maximum: 50 }
    validates :company, presence: true, length: { maximum: 50 }
    validates :position, presence: true, length: { maximum: 50 }
    validates :picture_url, presence: true, length: { maximum: 50 }
    validates :intro, presence: true, length: { maximum: 1000 }



end




