class Post < ActiveRecord::Base
has_and_belongs_to_many :tags

	has_attached_file :image,
		:styles => { :medium => "300x300#"},
		:storage => :s3,
		:s3_credentials => { :bucket => 'jean_instagram',
		:access_key_id => Rails.application.secrets.s3_access_key_id,
		:secret_access_key => Rails.application.secrets.s3_secret_access_key}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def tags_list

  end

  def tags_list=(passed_tags)
  	return if passed_tags.empty?
      passed_tags.split(' ').uniq.each do|tag|
  	 self.tags << Tag.find_or_create_by(text: tag)
    end
  end

end
