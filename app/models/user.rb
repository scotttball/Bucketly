class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  
  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "http://img1.wikia.nocookie.net/__cb20141028171337/pandorahearts/images/a/ad/Not_available.jpg",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    fog_directory: ENV["S3_BUCKET_NAME"]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
