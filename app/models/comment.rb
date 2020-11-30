class Comment < ApplicationRecord
	self.per_page = 15

	belongs_to :mission

	validates :name, presence: true, length: {maximum: 50}
	validates :team, presence: true
    validates :content, presence: true
    validates :multiplier, presence: true
    before_validation :strip_whitespace
    before_validation :force_names


	has_attached_file :avatar, styles: { medium: "900x506>", thumb: "100x100>" },
	:url  => ":s3_domain_url",
    :s3_region => "us-west-1",
    :s3_host_name => ENV["S3_HOST_NAME"],
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

    has_attached_file :video, styles: {
        :thumb => ["900x506>", :jpg],
        :mp4video => {
            :geometry => "1280x720",
            :format => 'mp4',
            :convert_options => {:output =>{:ar => 44100}
            }}
    },
    :processors => [:transcoder],
    :url  => ":s3_domain_url",
    :s3_region => "us-west-1",
    :s3_host_name => ENV["S3_HOST_NAME"],
    :path => "public/videos/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/

    
    def is_type_of_video?
        video.content_type =~ %r(video)
    end

    def is_type_of_image?
        avatar.content_type =~ %r(image)
    end

    private
    def strip_whitespace
        self.name = self.name.strip unless self.name.nil?
    end

    def force_names
        if self.name == "Yiping Wang"
            self.name = "Ella Wang"
        end
    end

end
