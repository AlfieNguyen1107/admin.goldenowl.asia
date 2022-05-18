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

SoftwareCategory.create name: 'Enterprise Resource Planning (ERP)'
SoftwareCategory.create name: 'Supply Chain & Logistics'
SoftwareCategory.create name: 'Inventory Management'
SoftwareCategory.create name: 'Geographical Information System (GIS)'
SoftwareCategory.create name: 'Supply Chain Management (SCM)'
SoftwareCategory.create name: 'Business Intelligence'
SoftwareCategory.create name: 'Data Analysis'
SoftwareCategory.create name: 'Content Management System (CMS)'
SoftwareCategory.create name: 'Document Management Systems (DMS)'
SoftwareCategory.create name: 'Task Management'
SoftwareCategory.create name: 'Collaboration'
SoftwareCategory.create name: 'Project Management'
SoftwareCategory.create name: 'Facility Management'
SoftwareCategory.create name: 'Asset Management (EAM)'
SoftwareCategory.create name: 'Graphic Design'
SoftwareCategory.create name: 'Video Editing'
SoftwareCategory.create name: '3D Modeling'
SoftwareCategory.create name: 'Accounting'
SoftwareCategory.create name: 'Payroll'
SoftwareCategory.create name: 'Cryptocurrency'
SoftwareCategory.create name: 'Point of Sale (POS)'
SoftwareCategory.create name: 'Live Chat'
SoftwareCategory.create name: 'Help Desk'
SoftwareCategory.create name: 'Cloud Security'
SoftwareCategory.create name: 'Natural Language Processing (NLP)'
SoftwareCategory.create name: 'Recruiting'
SoftwareCategory.create name: 'Absence & Leave Management'
SoftwareCategory.create name: 'Employee Management'
SoftwareCategory.create name: 'Human Resource Management (HRM)'
SoftwareCategory.create name: 'Performance Management'
SoftwareCategory.create name: 'Learning Management Systems (LMS)'
SoftwareCategory.create name: 'Marketing Automation'
SoftwareCategory.create name: 'Search Engine Optimization (SEO)'
SoftwareCategory.create name: 'GDPR'
SoftwareCategory.create name: 'Contract Management'
SoftwareCategory.create name: 'E-commerce'
SoftwareCategory.create name: 'Website Builder'
SoftwareCategory.create name: 'Event Management'
SoftwareCategory.create name: 'Customer Relationship Management (CRM)'
SoftwareCategory.create name: 'Field Service Management (FSM)'
SoftwareCategory.create name: 'Customer Support'

cats = SoftwareCategory.all.to_a



scg1 = SkillCategoryGroup.create name: 'Development'
scg2 = SkillCategoryGroup.create name: 'HR'
scg3 = SkillCategoryGroup.create name: 'Marketing'


sc1 = SkillCategory.create name: 'Database', skill_category_group: scg1
sc2 = SkillCategory.create name: 'Web Frontend', skill_category_group: scg1
sc3 = SkillCategory.create name: 'Web Backend', skill_category_group: scg1
sc4 = SkillCategory.create name: 'Mobile Native', skill_category_group: scg1
sc5 = SkillCategory.create name: 'Mobile Hybrid', skill_category_group: scg1
sc6 = SkillCategory.create name: 'UI/UX Designer', skill_category_group: scg1
sc7 = SkillCategory.create name: 'Blockchain', skill_category_group: scg1

# list out database choices
sc1.skills.create name: 'SQL'
sc1.skills.create name: 'NoSQL'

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

pl1 = F.create :programming_language, name: 'PHP'
pl2 = F.create :programming_language, name: 'Ruby'
pl3 = F.create :programming_language, name: 'Java'
pl4 = F.create :programming_language, name: 'C#'
pl5 = F.create :programming_language, name: 'Python'
pl6 = F.create :programming_language, name: 'Javascript'
pl7 = F.create :programming_language, name: 'Rust'
pl8 = F.create :programming_language, name: 'Solidity'
pl9 = F.create :programming_language, name: 'Swift'
pl10 = F.create :programming_language, name: 'Objective-C'
pl11 = F.create :programming_language, name: 'CSS'
# pl1 = F.create :programming_language, name: 'Ruby'
# pl1 = F.create :programming_language, name: 'Ruby'

programming_languages = ProgrammingLanguage.all.to_a

# php
F.create :framework, programming_language: pl1, name: 'Laravel'
F.create :framework, programming_language: pl1, name: 'Code Igniter'
F.create :framework, programming_language: pl1, name: 'Wordpress'
F.create :framework, programming_language: pl1, name: 'Drupal'
F.create :framework, programming_language: pl1, name: 'Yii'
F.create :framework, programming_language: pl1, name: 'CakePHP'
F.create :framework, programming_language: pl1, name: 'Magento'
# ruby
F.create :framework, programming_language: pl2, name: 'Ruby on Rails'
#java
F.create :framework, programming_language: pl3, name: 'Spring'
F.create :framework, programming_language: pl3, name: 'Hibernate'
F.create :framework, programming_language: pl3, name: 'Grails'
#C#
F.create :framework, programming_language: pl4, name: 'ASP.NET'
F.create :framework, programming_language: pl4, name: 'Orchard'
F.create :framework, programming_language: pl4, name: 'DotNetNuke'
F.create :framework, programming_language: pl4, name: 'Xamarin'
#Python
F.create :framework, programming_language: pl5, name: 'Falcon'
F.create :framework, programming_language: pl5, name: 'Django'
F.create :framework, programming_language: pl5, name: 'Flask'
#Javascript
F.create :framework, programming_language: pl6, name: 'Reactjs'
F.create :framework, programming_language: pl6, name: 'Angularjs'
F.create :framework, programming_language: pl6, name: 'Vuejs'
F.create :framework, programming_language: pl6, name: 'Senchajs'
F.create :framework, programming_language: pl6, name: 'Nestjs'
F.create :framework, programming_language: pl6, name: 'Ember'
F.create :framework, programming_language: pl6, name: 'Nodejs'
#rust
F.create :framework, programming_language: pl7, name: 'Solana'
F.create :framework, programming_language: pl7, name: 'Rocket'
#solidity
F.create :framework, programming_language: pl8, name: 'Solidity'
#CSS
F.create :framework, programming_language: pl11, name: 'Bootstrap'
F.create :framework, programming_language: pl11, name: 'MaterialUI'
F.create :framework, programming_language: pl11, name: 'Tailwind'
F.create :framework, programming_language: pl11, name: 'Foundation'

frameworks = Framework.all.to_a

#tools
# list out database choices
sc1.tools.create name: 'MySQL'
sc1.tools.create name: 'Postgres'
sc1.tools.create name: 'MS SQL'
sc1.tools.create name: 'Oracle'
sc1.tools.create name: 'MongoDB'

F.create :tool, skill_category: sc7, name: 'Hardhat'
F.create :tool, skill_category: sc7, name: 'Truffle'
F.create :tool, skill_category: sc7, name: 'Ganache'
F.create :tool, skill_category: sc7, name: 'Web3'

tools = Tool.all.to_a

contacts = F.create_list :contact, rand(50) + 1
rand(10).times do
  F.create :client, contactable: contacts.sample
end

University.create name: "HCMC University of Technology", code: 'BKU'
University.create name: "HCMC University of Information Technology", code: 'UIT'

universities = University.all.to_a

certificates = F.create_list :certificate, 1 + rand(20)

(20 + rand(30)).times do 
  F.create :developer, position: positions.sample, university: universities.sample
end
devs = Developer.all.to_a
devs.each do |d|
  d.university = universities.sample
  # d.projects << projects.sample
  d.position = positions.sample
  d.education_histories << F.create(:education_history)
  rand(5).times do
    d.employment_histories << F.create(:employment_history)
  end
  d.certificate_employees << F.create(:certificate_employee, certificate: certificates.sample)
  rand(10).times do
    d.skills << skills.sample
  end

  rand(5).times do
    d.employee_tools << F.create(:employee_tool, tool: tools.sample)
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

employees = Employee.all.to_a

clients = Client.all.to_a
clients.each do |c|
  F.create_list :project, 1 + rand(20), client: c
end

projects = Project.all.to_a

projects.each do |p|
  rand(5).times do
    p.project_frameworks.create framework: frameworks.sample
  end

  p.project_tools.create tool: sc1.tools.sample
  p.project_skills.create skill: skills.sample

  
  (1 + rand(2)).times do
    p.pc_projects << F.create(:pc_project, project: p, project_coordinator: pcs.sample)
  end

  rand(5).times do
    p.project_member_requests << F.create(:project_member_request, project: p)
  end
  p.save!

  p.project_member_requests.each do |pmr|
    rand(3).times do
      pmr.project_member_assignments << F.create(:project_member_assignment, employee: employees.sample, project_member_request: pmr)
    end
    pmr.save!
  end

  rand(5).times do
    p.project_resources.create! url: 'https://drive.google.com/file/d/1BzJtHIm8YAvU0Jjl_CPO1WL4Sivg_1gv/view?usp=sharing', name: 'Project Requirements'
  end

  rand(5).times do
    p.project_screenshots.create! image: 
  end

  p.software_category_list = cats.shuffle.take(1 + rand(4)).map(&:name)
  p.save!

end
