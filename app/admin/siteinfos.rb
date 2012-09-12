ActiveAdmin.register Siteinfo do
  controller do 
    defaults finder: :find_by_identifier
  end
end
