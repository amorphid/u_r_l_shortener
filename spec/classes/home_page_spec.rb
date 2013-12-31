require "spec_helper"

describe HomePage do
  let(:home_page) { HomePage.new }

  context "#status_code" do
    it "return a status code" do
      status_code = home_page.status_code
      expect(status_code).to eq(200)
    end
  end
end
