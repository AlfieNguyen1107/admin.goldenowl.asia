require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      full_name: "Full Name",
      primary_phone_number: "Primary Phone Number",
      company_homepage_url: "Company Homepage Url",
      company_linkedin_url: "Company Linkedin Url",
      personal_linkedin_url: "Personal Linkedin Url",
      personal_facebook_url: "Personal Facebook Url",
      personal_twitter_url: "Personal Twitter Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Primary Phone Number/)
    expect(rendered).to match(/Company Homepage Url/)
    expect(rendered).to match(/Company Linkedin Url/)
    expect(rendered).to match(/Personal Linkedin Url/)
    expect(rendered).to match(/Personal Facebook Url/)
    expect(rendered).to match(/Personal Twitter Url/)
  end
end
