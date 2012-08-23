module ApplicationHelper
  def site_title
    Settings.site_title
  end
  def site_contact
    Settings.site_contact
  end
  def site_author
    Settings.site_author
  end
  def full_title(title)
    title ? "#{title} | #{site_title}" : site_title
  end
  def root_path
    ENV['RAILS_ROOT_PATH'] || '/'
  end
end
