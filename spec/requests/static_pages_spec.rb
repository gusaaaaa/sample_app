require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
    
  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit root_path
      page.should have_selector('title',
                                :text => "#{base_title}")
    end

		it "should not have a custom page title" do
			visit root_path
			page.should_not have_selector('title', :text => '| Home')
		end

  end

  describe "Help page" do
    
    it "should have the content 'Help'" do
      visit help_path 
      page.should have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title',
                                :text => "#{base_title} | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      page.should have_content('About Us')
    end

    it "should have the Title 'About Us'" do
      visit about_path
      page.should have_selector('title',
                                :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do

    it "should have an h1 tag with the content 'Contact'" do
      visit contact_path 
      page.should have_selector('h1',
                               :text => 'Contact')
    end

    it "should have the Title 'Contact'" do
      visit contact_path
      page.should have_selector('title',
                                :text => "#{base_title} | Contact")
    end
  end

end
