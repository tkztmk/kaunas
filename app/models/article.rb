require 'json'
require 'redcarpet'
require 'nkf'

class Article < ActiveRecord::Base
  attr_accessible :document, :metadata, :identifier
  after_initialize :set_default_params
  validates :identifier, presence: true
  validates_format_of :identifier, with: /^[0-9a-zA-Z_\-\.]+$/
  validates_uniqueness_of :identifier
  def document=(document)
    self[:document] = document && NKF.nkf('-dm0xWw', document)
  end
  def metadata=(metadata)
    self[:metadata] = metadata && NKF.nkf('-dm0xWw', metadata)
  end
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
  def to_param
    self.identifier
  end
  Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(filter_html: true))
  def document_as_html
    Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(filter_html: true)).render(self.document)
  end
end
