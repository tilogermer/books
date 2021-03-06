# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  fname       :string
#  lname       :string
#  category_id :integer
#  country_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  authorpath  :string
#

class Author < ApplicationRecord
	belongs_to :country
	belongs_to :category
	has_and_belongs_to_many :books

	
	mount_uploader :image, ImageUploader
	
	extend FriendlyId
    friendly_id :lname, use: :slugged

    def self.search(search)
    	where("fname LIKE ? OR lname LIKE ?", "%#{search}%", "%#{search}%" )
    end
end
