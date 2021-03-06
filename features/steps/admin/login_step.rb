# frozen_string_literal: true
Given(/^I am an admin user$/) do
  AdminUserFixture.create
end

Given(/^I am logged in as an admin$/) do
  login_as AdminUserFixture.create
  visit "/"
end

When(/^I log in as an admin$/) do
  admin = AdminUserFixture

  visit "/"
  click_on "Login"

  fill_in "Email Address", with: admin.email
  fill_in "Password", with: admin.password
  click_on "Login"
end

Then(/^I should be on the admin dashboard/) do
  expect(page).to have_content("Dashboard")
end

When(/^I log out as a an admin$/) do
  click_on "Log out"
end

Then(/^I should be on the login page/) do
  expect(page).to have_link("Login")
end
