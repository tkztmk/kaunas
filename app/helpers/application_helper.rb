module ApplicationHelper
  def full_title(title)
    title ? "#{title} | kaunas" : 'kaunas'
  end
  def root_path
    ENV['RAILS_ROOT_PATH'] || '/'
  end
end
