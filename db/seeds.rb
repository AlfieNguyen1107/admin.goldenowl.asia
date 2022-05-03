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
ast = ceo.children.create name: "Secretary"
cto = ceo.children.create name: "CTO"
om = ceo.children.create name: "OM"
hrm = om.children.create name: "HRM"
tl = cto.children.create name: "Techlead"
teamlead = tl.children.create name: "Teamlead"
mentor = tl.children.create name: "Mentor"
teamlead.children.create name: "Vice Lead"
teamlead.children.create name: "Developer"
em = cto.children.create name: "Engineering Manager"
pcl = cto.children.create name: "PC Lead"
pcl.children.create name: "Vice PC Lead"
pcl.children.create name: "Project Coordinator"
em.children.create name: "QC Lead"
hrm.children.create name: "C&B"
hrm.children.create name: "Recruiter"
hrm.children.create name: "Admin"

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

programming_languages = F.create_list :programming_language, rand(15) + 1

rand(30).times do
  F.create :framework, programming_language: programming_languages.sample
end

frameworks = Framework.all.to_a

scg1 = SkillCategoryGroup.create name: 'Development'
scg2 = SkillCategoryGroup.create name: 'HR'
scg3 = SkillCategoryGroup.create name: 'Marketing'


sc1 = SkillCategory.create name: 'Database', skill_category_group: scg1
sc2 = SkillCategory.create name: 'Web Frontend', skill_category_group: scg1
sc3 = SkillCategory.create name: 'Web Backend', skill_category_group: scg1
sc4 = SkillCategory.create name: 'Mobile Native', skill_category_group: scg1
sc5 = SkillCategory.create name: 'Mobile Hybrid', skill_category_group: scg1
sc6 = SkillCategory.create name: 'UI/UX Designer', skill_category_group: scg1

# list out database choices
sc1.skills.create name: 'MySQL'
sc1.skills.create name: 'Postgres'
sc1.skills.create name: 'MS SQL'
sc1.skills.create name: 'Oracle'
sc1.skills.create name: 'MongoDB'

sc2.skills.create name: 'Reactjs'
sc2.skills.create name: 'Angularjs'
sc2.skills.create name: 'Vuejs'

sc3.skills.create name: 'Ruby on Rails'
sc3.skills.create name: 'Nodejs'
sc3.skills.create name: 'Django'
sc3.skills.create name: 'Wordpress'

sc4.skills.create name: 'Android'
sc4.skills.create name: 'Swift iOS'
sc4.skills.create name: 'Objective-C iOS'

sc5.skills.create name: 'Flutter'
sc5.skills.create name: 'React Native'
sc5.skills.create name: 'Kotlin'
sc5.skills.create name: 'Ionic'

sc6.skills.create name: 'Figma'
sc6.skills.create name: 'Canva'
sc6.skills.create name: 'Photoshop'

skills = Skill.all.to_a


contacts = F.create_list :contact, rand(50)
rand(10).times do
  F.create :client, contactable: contacts.sample
end

clients = Client.all.to_a

clients.each do |c|
  F.create_list :project, 1 + rand(20), client: c
end

projects = Project.all.to_a

University.create name: "Ho Chi Minh City University of Technology", code: 'BKU'
University.create name: "Ho Chi Minh City University of Information Technology", code: 'UIT'

universities = University.all.to_a

certificates = F.create_list :certificate, 1 + rand(20)

(20 + rand(30)).times do 
  F.create :developer, position: positions.sample, university: universities.sample
end
devs = Developer.all.to_a
devs.each do |d|
  d.university = universities.sample
  d.projects << projects.sample
  d.position = positions.sample
  d.education_histories << F.create(:education_history)
  rand(5).times do
    d.employment_histories << F.create(:employment_history)
  end
  d.certificate_employees << F.create(:certificate_employee, certificate: certificates.sample)
  rand(10).times do
    d.skills << skills.sample
  end

  rand(10).times do
    d.project_histories << F.create(:project_history)
  end

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