Given('user on the saucedemo login page') do
  visit 'https://www.saucedemo.com'
end

When(/^user input username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  fill_in 'user-name', with: "#{username}"
  fill_in 'password', with: "#{password}"
end

And('user click the login button') do
  click_button 'login-button'
end

Then('user should be on the products page') do
  expect(page).to have_current_path('/inventory.html')
end

Then('user should see an error message for locked out user') do
  expect(page).to have_content('Epic sadface: Sorry, this user has been locked out.')
end

Then("user should see an error message credentials doesn't match") do
  expect(page).to have_content('Epic sadface: Username and password do not match any user in this service')
end