require "spec_helper"

feature URLShortener do
  background { visit "/" }

  scenario "page has a title" do
    title = page.title
    expect(title).to eq("URL Shortener")
  end
end
