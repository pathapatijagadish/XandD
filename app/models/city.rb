class City < ActiveRecord::Base
	has_many :attractions
	accepts_nested_attributes_for :attractions,:allow_destroy => true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
