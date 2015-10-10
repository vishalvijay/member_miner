class Member < ActiveRecord::Base
  ETHNIC_GROUP = {0 => "Asian", 1 => "Indian", 2 => "African Americans", 3 => "Asian Americans", 4 => "European", 5 => "British", 6 => "Jewish", 7 => "Latino", 8 => "Native American", 9 => "Arabic"}

  searchable do
    text :caption
    text :ethnicity
    float :weight
    float :height
    boolean :is_veg
    boolean :drink
    # date :dob
  end

  def self.find_ethnicity_name id
    ETHNIC_GROUP[id]
  end
end
