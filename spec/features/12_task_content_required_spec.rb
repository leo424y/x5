require 'rails_helper'

describe "Task with validation", type: :feature do   
  it "won't create without content" do
    visit new_task_path
    fill_in "Content", with: ''
    click_button "Create"

    expect(page).to have_content("Content can't be blank")
  end
  
  it "won't update without content" do
    Task.create!(id: 1, content: 'new task')

    visit edit_task_path(1)
    fill_in "Content", with: ''
    click_button "Update"

    expect(page).to have_content("Content can't be blank")
  end  
end