require 'rails_helper'

describe "User", type: :feature do   
  it "can create account" do
    visit signup_path
    fill_in "Name", with: "Leo"
    fill_in "Email", with: "leo@a.com"
    fill_in "Password", with: "x"
    fill_in "Password confirmation", with: "x"
    click_button "Sign Up"

    expect(page).to have_content(/Leo/i)
  end

  it "can login" do
    visit login_path
    fill_in "Email", with: "l@l"
    fill_in "Password", with: "y"
    click_button "Submit"

    expect(page).to have_content(/Leo/i)
  end

  it "can logout" do
    visit root_path
    click_link "Logout"

    expect(page).to have_content(/Login/i)
  end  
end