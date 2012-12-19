require 'spec_helper'

describe "Micropost pages" do
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "sidebar micropost" do

		describe "with one micropost" do
			before do
 			 	FactoryGirl.create(:micropost, user: user) 
				visit root_path
			end
			
			it "should display '1 micropost'" do
				should have_content("1 micropost")
			end
		end

		describe "many microposts" do
			before(:all) { 50.times { FactoryGirl.create(:micropost, user: user) } }
			after(:all) { User.delete_all }

			before { visit root_path }

			it "should display 50 'microposts'" do
				should have_content("50 microposts")
			end

			it "should paginate" do
				should have_selector('div.pagination')
				user.microposts.paginate(page: 1).each do |micropost|
					should have_selector("li##{micropost.id}")
				end
			end
		end

	end

	describe "micropost creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create a micropost" do
				expect { click_button "Post" }.not_to change(Micropost, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'micropost_content', with: "Lorem ipsum" }
			it "should create a micropost" do
				expect { click_button "Post" }.to change(Micropost, :count).by(1)
			end
		end
	end

	describe "micropost destruction" do
		before { FactoryGirl.create(:micropost, user: user) }

		describe "as correct user" do
			before { visit root_path }

			it "should delete a micropost" do
				expect { click_link "delete" }.to change(Micropost, :count).by(-1)
			end
		end

	end

end

