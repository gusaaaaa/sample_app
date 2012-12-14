include ApplicationHelper

def valid_signin(user)
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button 'Sign in'
end

def valid_signup(user)
	fill_in "Name", with: user.name
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	fill_in "Confirmation", with: user.password
	click_button "Create my account" 
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		if message.nil?
			page.should have_selector('div.alert.alert-error')
		else
			page.should have_selector('div.alert.alert-error', text: message)
		end
	end
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-success', text: message)
	end
end

RSpec::Matchers.define :have_titles do |heading, page_title|
	match do |page|
			page.should have_selector('h1', text: heading)
			page.should have_selector('title', text: page_title)
	end
end

