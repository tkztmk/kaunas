class Siteinfo < ActiveRecord::Base
  attr_accessible :author, :contact, :title, :identifier
  after_initialize :set_default_params
  validates :identifier, presence: true
  validates_format_of :identifier, with: /^[0-9a-zA-Z_\-\.]+$/
  validates_uniqueness_of :identifier
  def set_default_params
    self.identifier = self.identifier || 
      'default'
    self.author = self.author ||
      Settings.default_site_author
    self.contact = self.contact ||
      Settings.default_site_contact
    self.title = self.title || 
      Settings.default_site_title
  end
  def to_param
    self.identifier
  end
end
