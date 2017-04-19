class Post < ApplicationRecord
	validates :title, presence: true 
	validates :body, presence: true
	validates :description, presence: true 
	validates :banner_image_url, presence: true 
	
	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		title_changed?
	end
	
	def display_day_published
		"Published #{created_at.strftime('%-b %-d, %-Y')}"
	end

	belongs_to :user
	has_many :comments, dependent: :destroy
end
