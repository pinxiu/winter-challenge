class Comment < ApplicationRecord
	self.per_page = 10

	belongs_to :mission

	validates :name, presence: true, length: {maximum: 50}
	validates :team, presence: true, length: {maximum: 3}
    before_validation :strip_whitespace


	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
	:url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]


	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    private
    def strip_whitespace
        self.name = self.name.strip unless self.name.nil?
    end

end
