class Comment < ApplicationRecord
	belongs_to :mission

	validates :name, presence: true, length: {maximum: 50}
	validates :team, presence: true, length: {maximum: 3}

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
