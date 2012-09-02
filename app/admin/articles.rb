ActiveAdmin.register Article do
  controller do 
    defaults finder: :find_by_identifier
  end
end
