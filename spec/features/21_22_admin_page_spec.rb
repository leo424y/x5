require 'rails_helper'

describe "Admin", type: :feature do   

  it "can view all users" do
    visit admin_users_path

    expect(page).to have_content(/Leo/i)
  end

  it "can create users" do
    visit new_admin_user_path
    click_link "Logout"

    expect(page).to have_content(/Login/i)
  end  

  # it "can edit users" do
  #   visit edit_admin_user_path(@user2)
 
  #   fill_in "Name", with: "Fly2"
  #   fill_in "Email", with: "f@f"
  #   fill_in "Password", with: "x"
  #   fill_in "Password Confirmation", with: "x"

  #   click_button "Update User"

  #   expect(page).to have_content(/Fly2/i)
  # end  

  it "can show user tasks counts" do
    @user.tasks.create!(content: 'Love U')
    visit admin_users_path

    expect(page).to have_content(/Name Email Role Task Counts Leo l@l admin 1/i)
  end

  it "can delete users with their tasks" do
    visit admin_users_path
    click_link "Destroy"

    expect(page).to_not have_content(/Fly/i)
  end 

  it "can delete users with their tasks" do
    @user2.tasks.create!(content: 'Love U')
    visit admin_users_path
    click_link "Destroy"

    visit root_path
    expect(Task.count).to eql 0
  end

  it "can visit admin page as admin" do
    visit admin_users_path
    expect(page).to have_content(/Fly/i)
  end

  it "cannot visit admin page if its role is not admin" do
    ApplicationController.any_instance.stub(:current_user) { @user2 }

    visit admin_users_path
    expect(page).to have_content(/You must be admin to see this page/i)
    expect(page).to have_content(/404/i)
    expect(page).to have_content(/Oops! This Page Could Not Be Found/i)
  end

  it "cannot destroy themselves" do
    visit admin_users_path

    expect(page).not_to have_content(/Leo l@l admin 0 Edit Destroy/i)
  end

  it "cannot change themselves' role" do
    visit edit_admin_user_path(@user)

    expect(page).not_to have_content(/Role/i)
  end 
end