require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        full_name: "Full Name",
        primary_phone_number: "Primary Phone Number",
        company_homepage_url: "Company Homepage Url",
        company_linkedin_url: "Company Linkedin Url",
        personal_linkedin_url: "Personal Linkedin Url",
        personal_facebook_url: "Personal Facebook Url",
        personal_twitter_url: "Personal Twitter Url"
      ),
      Contact.create!(
        full_name: "Full Name",
        primary_phone_number: "Primary Phone Number",
        company_homepage_url: "Company Homepage Url",
        company_linkedin_url: "Company Linkedin Url",
        personal_linkedin_url: "Personal Linkedin Url",
        personal_facebook_url: "Personal Facebook Url",
        personal_twitter_url: "Personal Twitter Url"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "Primary Phone Number".to_s, count: 2
    assert_select "tr>td", text: "Company Homepage Url".to_s, count: 2
    assert_select "tr>td", text: "Company Linkedin Url".to_s, count: 2
    assert_select "tr>td", text: "Personal Linkedin Url".to_s, count: 2
    assert_select "tr>td", text: "Personal Facebook Url".to_s, count: 2
    assert_select "tr>td", text: "Personal Twitter Url".to_s, count: 2
  end
end
