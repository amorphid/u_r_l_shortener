require "spec_helper"

feature URLShortener do
  background { visit "/" }

  scenario "displays text" do
    body = page.body
    expect(body).to have_content("URL Shortener")
  end
end
