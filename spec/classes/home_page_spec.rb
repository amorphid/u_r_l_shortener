require "spec_helper"

describe HomePage do
  let(:home_page) { HomePage.new }

  context "#headers" do
    it "returns headers" do
      headers = home_page.headers
      expect(headers).to eq({})
    end
  end

  context "#status_code" do
    it "returns a status code" do
      status_code = home_page.status_code
      expect(status_code).to eq(200)
    end
  end
end
