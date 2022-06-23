# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [ "Year 1 to 6", "Year 7 to 10", "Year 11, 12", "TAFE", "University" ]

if Category.count == 0
    categories.each do |category|
        Category.create(name: category)
        puts "created #{category} category"
    end
end

# subjects = ["English", "Second Languages", "Science", "Mathematics", "Technology", "The Arts", "Humanities", "Business Studies", "Health and Physical Education", "Accounting", "Aged Care", "Beauty", "Child Care", "Community Services", "Building & Constraction", "Business & Commerce", "Education & Teaching", "Arts", "Health", "IT", "Hospitality", "Sports", "Nursing","Criminology", "Engineering", "Music", "Medicine", "Law", "Others"]

# if Category.count == 0
#     subjects.each do |subject|
#         Category.create(name: subject)
#         puts "created #{subject} category"
#     end
# end
