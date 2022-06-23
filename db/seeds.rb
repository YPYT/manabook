# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grades = ["Year 1 to 6", "Year 7 to 10", "Year 11, 12", "TAFE", "University"]
subjects = ["English", "Second Languages", "Science", "Mathematics", "Technology", "The Arts", "Humanities", "Business Studies", "Health and Physical Education", "Accounting", "Aged Care", "Beauty", "Child Care", "Community Services", "Building & Constraction", "Business & Commerce", "Education & Teaching", "Arts", "Health", "IT", "Hospitality", "Sports", "Nursing","Criminology", "Engineering", "Music", "Medicine", "Law", "Others"]

if Category.count == 0
    grades.each do |grade|
        Category.create(name: grade)
        puts "created #{grade} category"
    end
end

if
    subjects.each do |subject|
        Category.create(name: subject)
        puts "created #{subject} category"
    end
end
