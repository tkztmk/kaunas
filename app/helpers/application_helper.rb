module ApplicationHelper
  def default_siteinfo
    Siteinfo.find_by_identifier('default') || Siteinfo.new
  end
  def site_title
    default_siteinfo.title
  end
  def site_contact
    default_siteinfo.contact
  end
  def site_author
    default_siteinfo.author
  end
  def full_title(title)
    title ? "#{title} | #{site_title}" : site_title
  end
  def root_path
    ENV['RAILS_ROOT_PATH'] || '/'
  end
end
