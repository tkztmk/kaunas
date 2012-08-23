require 'json'
class Article < ActiveRecord::Base
  attr_accessible :document, :metadata, :identifier
  after_initialize :set_default_params
  validates :identifier, presence: true
  validates_format_of :identifier, with: /^[0-9a-zA-Z_\-\.]+$/
  validates_uniqueness_of :identifier
  def set_default_params
    self.identifier = self.identifier || 
      'the_identifier_of_this_article'
    self.metadata = self.metadata || JSON.pretty_generate(
      title: 'the title of this article', 
      updated_at: Time.now, 
      tag: '#tag_of_this_article #multiple_tags_are_allowed'
    )
    self.document = self.document || "# #{JSON.load(self.metadata)['title']}"
  end
end
