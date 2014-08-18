class Post < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300#"}, :storage => :s3, :s3_credentials => { :bucket => 'jean_instagram', :access_key_id => Rails.application.secrets.s3_access_key_id, :secret_access_key => Rails.application.secrets.s3_secret_access_key}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
