class Comment < ApplicationRecord
	belongs_to :mission

	validates :name, presence: true, length: {maximum: 50}
	validates :team, presence: true, length: {maximum: 3}

end
