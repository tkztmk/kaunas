class Article < ActiveRecord::Base
  attr_accessible :document, :document_metadata, :document_title, :document_type, :document_updated_at, :tag
end
