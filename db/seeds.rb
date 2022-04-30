# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create email: 'admin@goldenowl.asia', password: '123456', password_confirmation: '123456'
require 'factory_bot_rails'

F = FactoryBot

Tech.create([
  {
    name: "Rails",
    tech_type: 1
  },
  {
    name: "ReactJS",
    tech_type: 0
  },
  {
    name: "NodeJS",
    tech_type: 1
  },
  {
    name: "PHP",
    tech_type: 1
  },
])

DevelopmentType.create([
  {
    name: "Mobile IOS"
  },
  {
    name: "Mobile Android"
  },
  {
    name: "Website"
  },
])

positions = Position.create([
  {
    name: "Mobile Dev"
  },
  {
    name: "Frontend Dev"
  },
  {
    name: "Fullstack Dev"
  },
  {
    name: "QC"
  },
  {
    name: "PC"
  },
])


clients = F.create_list :client, rand(10)

clients.each do |c|
  F.create_list :project, rand(20), client: c
end

projects = Project.all.to_a

University.create name: "Ho Chi Minh City University of Technology", code: 'BKU'
University.create name: "Ho Chi Minh City University of Information Technology", code: 'UIT'

universities = University.all.to_a

rand(100).times do 
  F.create :developer, position: positions.sample, university: universities.sample
end
devs = Developer.all.to_a
devs.each do |d|
  d.university = universities.sample
  d.projects << projects.sample
  d.position = positions.sample
  d.save
end
