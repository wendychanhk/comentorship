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
    validates :company, presence: true, length: { maximum: 50 }
    validates :position, presence: true, length: { maximum: 50 }
    validates :intro, presence: true, length: { maximum: 1000 }
    validates :country_code, presence: true
    validates :screen_name, presence: true, length: { maximum: 50 }
    validates :avatar, presence: true
    validates :need, presence: true
    validates :skill, presence: true




    has_many :conversations, :foreign_key => :sender_id


     has_attached_file :avatar, :styles => {:medium => "200x200>", :thumb => "50x50#" }, :default_url => "/images/:style/default_image.png"
        validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


#paperclip save the original images with these two versions. After uploading the image, you can only call these two sizes
#rake paperclip:refresh CLASS=User -> refresh all style


filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
              :available_filters => %w[
                search_query
                sorted_by
              ]


 self.per_page = 10



  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.insert(0, '*').split(/W/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s


    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 3
  where(
    terms.map { |term|
      "(LOWER(users.city) LIKE ? OR LOWER(users.intro) LIKE ? OR LOWER(users.country_code) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
}




  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("users.created_at #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


def self.options_for_sorted_by
      ['Name (a-z)', 'name_asc']
    
  end









end




