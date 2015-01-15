# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ name: "relationships" },
                 { name: "family" },
                 { name: "life" },
                 { name: "money" },
                 { name: "politics" },
                 { name: "school" },
                 { name: "work" },
                 { name: "sports" },
                 { name: "miscellaneous" }])

# require 'faker'
# 100.times do
#   Vent.create
# end
