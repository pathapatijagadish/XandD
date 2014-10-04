class Hotel < ActiveRecord::Base
	has_many :images, as: :imageable
	has_many :videos, as: :videoable
	accepts_nested_attributes_for :images,:allow_destroy => true
	accepts_nested_attributes_for :videos,:allow_destroy => true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
