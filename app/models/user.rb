class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    before_save { self.email = email.downcase }


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
    validates :intro, presence: true, length: { maximum: 1000 }



    has_and_belongs_to_many :skills 
    has_and_belongs_to_many :wanteds

    has_many :conversations, :foreign_key => :sender_id


     has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
        validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/




  




end




