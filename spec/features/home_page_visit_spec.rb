require "spec_helper"

feature "Submitting a URL to shorten" do
  let(:root_path) { "/" }
  background { visit root_path }

  context "via a web form" do
    scenario "loads the home page" do
      fill_in :long_url, with: "http://www.foo.com"
      click_button "Submit"
      expect(current_path).to eq(root_path)
    end
  end
end
