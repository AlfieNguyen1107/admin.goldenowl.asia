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

ceo = Position.create name: "CEO"
cto = ceo.children.create name: "CTO"
om = ceo.children.create name: "OM"
hrm = om.children.create name: "HRM"

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

programming_languages = F.create_list :programming_language, rand(15)

rand(30).times do
  F.create :framework, programming_language: programming_languages.sample
end

frameworks = Framework.all.to_a



contacts = F.create_list :contact, rand(50)
rand(10).times do
  F.create :client, contactable: contacts.sample
end

clients = Client.all.to_a

clients.each do |c|
  F.create_list :project, rand(20), client: c
end

projects = Project.all.to_a

University.create name: "Ho Chi Minh City University of Technology", code: 'BKU'
University.create name: "Ho Chi Minh City University of Information Technology", code: 'UIT'

universities = University.all.to_a

(20 + rand(30)).times do 
  F.create :developer, position: positions.sample, university: universities.sample
end
devs = Developer.all.to_a
devs.each do |d|
  d.university = universities.sample
  d.projects << projects.sample
  d.position = positions.sample
  d.save

  rand(3).times do
    d.developer_programming_languages.create programming_language: programming_languages.sample, level: rand(5)
  end

  rand(10).times do
    d.developer_frameworks.create framework: frameworks.sample, level: rand(5)
  end
end

rand(10).times do
  F.create :project_coordinator
end

pcs = ProjectCoordinator.all.to_a
pcs.each do |p|
  F.create :pc_project, project: projects.sample, project_coordinator: pcs.sample
end

interns = F.create_list :intern, 10
interns.each do |i|
  rand(2).times do
    i.mentor = devs.sample
    i.save
  end
  rand(5).times do
    F.create :assignment, assigned_to: i
  end
end