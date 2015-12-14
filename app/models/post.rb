class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://img1.wikia.nocookie.net/__cb20141028171337/pandorahearts/images/a/ad/Not_available.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end