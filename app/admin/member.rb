ActiveAdmin.register Member do
  permit_params :id, :caption, :ethnicity, :weight, :height, :is_veg, :drink, :dob
end
