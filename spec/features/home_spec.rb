require 'rails_helper'
require 'nokogiri'

RSpec.describe HomeController, type: :request do
  describe "GET /home/index (Home Page)" do
    context "when visiting the homepage" do
      it "returns a successful response" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        expect(response).to render_template(:index)
      end
    end

    context "when checking homepage content" do
      it "displays the welcome message" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        expect(response.body).to include("Welcome to the Marketplace")
        expect(response.body).to include("Find everything you need here")
      end

      it "contains a search bar" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        parsed_html = Nokogiri::HTML(response.body)
        search_field = parsed_html.at_css("input[type='text'][placeholder='Search']")
        expect(search_field).not_to be_nil
      end

      it "has a navbar with essential links" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        expect(response.body).to include("Categories")
        expect(response.body).to include("Cart")
        expect(response.body).to include("Account")
      end

      it "displays three product placeholders" do
        get home_index_path  # 🔄 Change from root_path to home_index_path
        parsed_html = Nokogiri::HTML(response.body)
        expect(parsed_html.css("h5.card-title").size).to eq(3)
      end
    end
  end
end
