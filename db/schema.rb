# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_16_105252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignment_scores", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.bigint "assignment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignment_scores_on_assignment_id"
    t.index ["name"], name: "index_assignment_scores_on_name"
    t.index ["score"], name: "index_assignment_scores_on_score"
  end

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "from_date"
    t.date "to_date"
    t.bigint "assigned_to_id", null: false
    t.bigint "assigned_by_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assigned_by_id"], name: "index_assignments_on_assigned_by_id"
    t.index ["assigned_to_id"], name: "index_assignments_on_assigned_to_id"
    t.index ["name"], name: "index_assignments_on_name"
  end

  create_table "careers", force: :cascade do |t|
    t.string "title", null: false
    t.string "job_type"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "slug"
    t.index ["slug"], name: "index_careers_on_slug", unique: true
  end

  create_table "certificate_employees", force: :cascade do |t|
    t.bigint "certificate_id", null: false
    t.bigint "employee_id", null: false
    t.integer "year"
    t.string "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certificate_id"], name: "index_certificate_employees_on_certificate_id"
    t.index ["employee_id"], name: "index_certificate_employees_on_employee_id"
    t.index ["score"], name: "index_certificate_employees_on_score"
    t.index ["year"], name: "index_certificate_employees_on_year"
  end

  create_table "certificates", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_certificates_on_name"
    t.index ["rating"], name: "index_certificates_on_rating"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "hq"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "nationality"
    t.string "contactable_type"
    t.bigint "contactable_id"
    t.index ["contactable_type", "contactable_id"], name: "index_clients_on_contactable_type_and_contactable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "registration_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_companies_on_name"
    t.index ["registration_number"], name: "index_companies_on_registration_number"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "primary_phone_number"
    t.string "company_homepage_url"
    t.string "company_linkedin_url"
    t.string "personal_linkedin_url"
    t.string "personal_facebook_url"
    t.string "personal_twitter_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "based_nationality"
    t.string "current_living_country"
    t.index ["based_nationality"], name: "index_contacts_on_based_nationality"
    t.index ["current_living_country"], name: "index_contacts_on_current_living_country"
    t.index ["full_name"], name: "index_contacts_on_full_name"
  end

  create_table "developer_frameworks", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "framework_id", null: false
    t.integer "level"
    t.integer "start_counting_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["developer_id"], name: "index_developer_frameworks_on_developer_id"
    t.index ["framework_id"], name: "index_developer_frameworks_on_framework_id"
    t.index ["level"], name: "index_developer_frameworks_on_level"
    t.index ["start_counting_year"], name: "index_developer_frameworks_on_start_counting_year"
  end

  create_table "developer_programming_languages", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "programming_language_id", null: false
    t.integer "level"
    t.integer "start_counting_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["developer_id"], name: "index_developer_programming_languages_on_developer_id"
    t.index ["level"], name: "index_developer_programming_languages_on_level"
    t.index ["programming_language_id"], name: "ind_dev_prog_fk"
    t.index ["start_counting_year"], name: "index_developer_programming_languages_on_start_counting_year"
  end

  create_table "developer_projects", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "current"
    t.date "join_date"
    t.index ["developer_id"], name: "index_developer_projects_on_developer_id"
    t.index ["project_id"], name: "index_developer_projects_on_project_id"
  end

  create_table "developer_teches", force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "tech_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["developer_id"], name: "index_developer_teches_on_developer_id"
    t.index ["tech_id"], name: "index_developer_teches_on_tech_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "senority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company_name"
    t.string "belong_team"
    t.bigint "university_id"
    t.integer "graduation_year"
    t.bigint "position_id", null: false
    t.integer "employable_id"
    t.string "employable_type"
    t.string "type", default: "Developer"
    t.bigint "mentor_id"
    t.index ["company_name"], name: "index_developers_on_company_name", unique: true
    t.index ["employable_id"], name: "index_developers_on_employable_id"
    t.index ["employable_type"], name: "index_developers_on_employable_type"
    t.index ["mentor_id"], name: "index_developers_on_mentor_id"
    t.index ["position_id"], name: "index_developers_on_position_id"
    t.index ["type"], name: "index_developers_on_type"
    t.index ["university_id"], name: "index_developers_on_university_id"
  end

  create_table "developers_projects", id: false, force: :cascade do |t|
    t.bigint "developer_id", null: false
    t.bigint "project_id", null: false
    t.index ["developer_id", "project_id"], name: "index_developers_projects_on_developer_id_and_project_id"
    t.index ["project_id", "developer_id"], name: "index_developers_projects_on_project_id_and_developer_id"
  end

  create_table "development_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "development_types_projects", force: :cascade do |t|
    t.bigint "development_type_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["development_type_id"], name: "index_development_types_projects_on_development_type_id"
    t.index ["project_id"], name: "index_development_types_projects_on_project_id"
  end

  create_table "education_histories", force: :cascade do |t|
    t.bigint "university_id", null: false
    t.bigint "employee_id", null: false
    t.string "subject"
    t.date "from"
    t.date "to"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "degree"
    t.index ["degree"], name: "index_education_histories_on_degree"
    t.index ["employee_id"], name: "index_education_histories_on_employee_id"
    t.index ["subject"], name: "index_education_histories_on_subject"
    t.index ["university_id"], name: "index_education_histories_on_university_id"
  end

  create_table "employee_skills", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "skill_id", null: false
    t.integer "level"
    t.integer "years_of_exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_skills_on_employee_id"
    t.index ["skill_id"], name: "index_employee_skills_on_skill_id"
  end

  create_table "employee_tools", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "tool_id", null: false
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_employee_tools_on_employee_id"
    t.index ["level"], name: "index_employee_tools_on_level"
    t.index ["tool_id"], name: "index_employee_tools_on_tool_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.string "current_address"
    t.integer "emp_number"
    t.string "phone_number"
    t.string "registered_address"
    t.date "joined_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "position_id", null: false
    t.integer "employment_status"
    t.integer "contract_status"
    t.integer "working_arrangement"
    t.integer "genger"
    t.string "email"
    t.text "career_objectives"
    t.index ["contract_status"], name: "index_employees_on_contract_status"
    t.index ["email"], name: "index_employees_on_email"
    t.index ["emp_number"], name: "index_employees_on_emp_number"
    t.index ["employment_status"], name: "index_employees_on_employment_status"
    t.index ["full_name"], name: "index_employees_on_full_name"
    t.index ["genger"], name: "index_employees_on_genger"
    t.index ["position_id"], name: "index_employees_on_position_id"
    t.index ["working_arrangement"], name: "index_employees_on_working_arrangement"
  end

  create_table "employment_histories", force: :cascade do |t|
    t.string "profession"
    t.date "from"
    t.date "to"
    t.integer "contract_status"
    t.integer "order"
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "details"
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_employment_histories_on_company_id"
    t.index ["contract_status"], name: "index_employment_histories_on_contract_status"
    t.index ["employee_id"], name: "index_employment_histories_on_employee_id"
    t.index ["order"], name: "index_employment_histories_on_order"
    t.index ["profession"], name: "index_employment_histories_on_profession"
  end

  create_table "frameworks", force: :cascade do |t|
    t.string "name"
    t.bigint "programming_language_id", null: false
    t.integer "year_of_release"
    t.string "latest_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "skill_category_id"
    t.index ["latest_version"], name: "index_frameworks_on_latest_version"
    t.index ["name"], name: "index_frameworks_on_name"
    t.index ["programming_language_id"], name: "index_frameworks_on_programming_language_id"
    t.index ["skill_category_id"], name: "index_frameworks_on_skill_category_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "job_submissions", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "port_folio"
    t.text "answer"
    t.string "cv_upload"
    t.integer "career_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pc_projects", force: :cascade do |t|
    t.date "join_date"
    t.bigint "project_coordinator_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "finished_date"
    t.index ["project_coordinator_id"], name: "index_pc_projects_on_project_coordinator_id"
    t.index ["project_id"], name: "index_pc_projects_on_project_id"
  end

  create_table "pcs", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "company_name", null: false
    t.string "level", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_positions_on_ancestry"
    t.index ["name"], name: "index_positions_on_name"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.datetime "deleted_at"
    t.index ["slug"], name: "index_post_categories_on_slug", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "source"
    t.string "post_type"
    t.string "slug"
    t.bigint "post_category_id"
    t.boolean "deleted", default: false
    t.string "meta_title"
    t.string "meta_keyword"
    t.string "meta_description"
    t.index ["post_category_id"], name: "index_posts_on_post_category_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name"
    t.integer "year_of_release"
    t.string "latest_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latest_version"], name: "index_programming_languages_on_latest_version"
    t.index ["name"], name: "index_programming_languages_on_name"
  end

  create_table "project_coordinators", force: :cascade do |t|
    t.string "employable_type", null: false
    t.bigint "employable_id", null: false
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employable_type", "employable_id"], name: "index_project_coordinators_on_employable_type_and_employable_id"
    t.index ["level"], name: "index_project_coordinators_on_level"
  end

  create_table "project_frameworks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "framework_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["framework_id"], name: "index_project_frameworks_on_framework_id"
    t.index ["project_id"], name: "index_project_frameworks_on_project_id"
  end

  create_table "project_histories", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.string "position"
    t.date "from"
    t.date "to"
    t.integer "order"
    t.text "details"
    t.bigint "developer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_project_histories_on_company_id"
    t.index ["developer_id"], name: "index_project_histories_on_developer_id"
    t.index ["name"], name: "index_project_histories_on_name"
    t.index ["position"], name: "index_project_histories_on_position"
  end

  create_table "project_member_assignments", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "project_member_request_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.bigint "shadow_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_project_member_assignments_on_employee_id"
    t.index ["project_member_request_id"], name: "index_project_member_assignments_on_project_member_request_id"
    t.index ["shadow_by_id"], name: "index_project_member_assignments_on_shadow_by_id"
  end

  create_table "project_member_requests", force: :cascade do |t|
    t.string "position"
    t.integer "engagement_type"
    t.date "requested_date"
    t.date "expected_date"
    t.boolean "billable"
    t.integer "status"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["engagement_type"], name: "index_project_member_requests_on_engagement_type"
    t.index ["position"], name: "index_project_member_requests_on_position"
    t.index ["project_id"], name: "index_project_member_requests_on_project_id"
  end

  create_table "project_resources", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name"
    t.string "file"
    t.string "url"
    t.string "storage_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["file"], name: "index_project_resources_on_file"
    t.index ["name"], name: "index_project_resources_on_name"
    t.index ["project_id"], name: "index_project_resources_on_project_id"
    t.index ["storage_name"], name: "index_project_resources_on_storage_name"
    t.index ["url"], name: "index_project_resources_on_url"
  end

  create_table "project_screenshots", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image"], name: "index_project_screenshots_on_image"
    t.index ["project_id"], name: "index_project_screenshots_on_project_id"
  end

  create_table "project_skills", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "skill_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_skills_on_project_id"
    t.index ["skill_id"], name: "index_project_skills_on_skill_id"
  end

  create_table "project_tools", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "tool_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_tools_on_project_id"
    t.index ["tool_id"], name: "index_project_tools_on_tool_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "end_date"
    t.bigint "client_id"
    t.date "start_date"
    t.string "deployment"
    t.string "website"
    t.string "git_repo"
    t.string "task_tracker_url"
    t.integer "industry"
    t.integer "rank", default: 0
    t.integer "status", default: 0
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["name"], name: "index_projects_on_name", unique: true
    t.index ["rank"], name: "index_projects_on_rank"
    t.index ["status"], name: "index_projects_on_status"
  end

  create_table "projects_teches", id: false, force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "tech_id", null: false
    t.index ["project_id", "tech_id"], name: "index_projects_teches_on_project_id_and_tech_id"
    t.index ["tech_id", "project_id"], name: "index_projects_teches_on_tech_id_and_project_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.bigint "skill_category_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_skill_categories_on_name"
    t.index ["skill_category_group_id"], name: "index_skill_categories_on_skill_category_group_id"
  end

  create_table "skill_category_groups", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_skill_category_groups_on_name"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.bigint "skill_category_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_skills_on_name"
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  create_table "software_categories", force: :cascade do |t|
    t.string "name"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_software_categories_on_name"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "subscription_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "teches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tech_type"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.bigint "skill_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tools_on_name"
    t.index ["skill_category_id"], name: "index_tools_on_skill_category_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_universities_on_code"
    t.index ["name"], name: "index_universities_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignment_scores", "assignments"
  add_foreign_key "assignments", "developers", column: "assigned_to_id"
  add_foreign_key "assignments", "employees", column: "assigned_by_id"
  add_foreign_key "certificate_employees", "certificates"
  add_foreign_key "certificate_employees", "employees"
  add_foreign_key "developer_frameworks", "developers"
  add_foreign_key "developer_frameworks", "frameworks"
  add_foreign_key "developer_programming_languages", "developers"
  add_foreign_key "developer_programming_languages", "programming_languages"
  add_foreign_key "developer_projects", "developers"
  add_foreign_key "developer_projects", "projects"
  add_foreign_key "developer_teches", "developers"
  add_foreign_key "developer_teches", "teches"
  add_foreign_key "developers", "developers", column: "mentor_id"
  add_foreign_key "developers", "positions"
  add_foreign_key "developers", "universities"
  add_foreign_key "development_types_projects", "development_types"
  add_foreign_key "development_types_projects", "projects"
  add_foreign_key "education_histories", "employees"
  add_foreign_key "education_histories", "universities"
  add_foreign_key "employee_skills", "employees"
  add_foreign_key "employee_skills", "skills"
  add_foreign_key "employee_tools", "employees"
  add_foreign_key "employee_tools", "tools"
  add_foreign_key "employees", "positions"
  add_foreign_key "employment_histories", "companies"
  add_foreign_key "employment_histories", "employees"
  add_foreign_key "frameworks", "programming_languages"
  add_foreign_key "frameworks", "skill_categories"
  add_foreign_key "job_submissions", "careers"
  add_foreign_key "pc_projects", "project_coordinators"
  add_foreign_key "pc_projects", "projects"
  add_foreign_key "project_frameworks", "frameworks"
  add_foreign_key "project_frameworks", "projects"
  add_foreign_key "project_histories", "companies"
  add_foreign_key "project_histories", "developers"
  add_foreign_key "project_member_assignments", "employees"
  add_foreign_key "project_member_assignments", "employees", column: "shadow_by_id"
  add_foreign_key "project_member_assignments", "project_member_requests"
  add_foreign_key "project_member_requests", "projects"
  add_foreign_key "project_resources", "projects"
  add_foreign_key "project_screenshots", "projects"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "project_skills", "skills"
  add_foreign_key "project_tools", "projects"
  add_foreign_key "project_tools", "tools"
  add_foreign_key "projects", "clients"
  add_foreign_key "skill_categories", "skill_category_groups"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tools", "skill_categories"
end
