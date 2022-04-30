require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      full_name: "MyString",
      primary_phone_number: "MyString",
      company_homepage_url: "MyString",
      company_linkedin_url: "MyString",
      personal_linkedin_url: "MyString",
      personal_facebook_url: "MyString",
      personal_twitter_url: "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[full_name]"

      assert_select "input[name=?]", "contact[primary_phone_number]"

      assert_select "input[name=?]", "contact[company_homepage_url]"

      assert_select "input[name=?]", "contact[company_linkedin_url]"

      assert_select "input[name=?]", "contact[personal_linkedin_url]"

      assert_select "input[name=?]", "contact[personal_facebook_url]"

      assert_select "input[name=?]", "contact[personal_twitter_url]"
    end
  end
end
