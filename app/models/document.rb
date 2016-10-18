class Document < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true # Make sure 	
end