require "csv"
namespace :data do 
  task import: :environment do
    def read_boolean d
      if d.present?
        d == "1" ? true : false
      else
        nil
      end
    end
    puts "Start\n"
    csv = CSV.parse(File.read(Rails.root.join("data").join("dump-1k.csv")).gsub(/\\"/,'""'))
    csv.each do |row|
      Member.create(dob: row[1], caption: row[2], ethnicity: Member.find_ethnicity_name(row[3] ? row[3].to_i : -1), weight: (row[4].present? ? row[4].to_f/1000 : nil), height: (row[5].present? ? row[5] : nil), is_veg: read_boolean(row[6]), drink: read_boolean(row[7]))
    end
    puts "End\n"
  end
end