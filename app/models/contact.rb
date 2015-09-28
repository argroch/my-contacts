class Contact < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	geocoded_by :full_address
	after_validation :geocode

  def full_address
  	"#{address}, #{city}, #{state}, #{zip}"
  end
end
