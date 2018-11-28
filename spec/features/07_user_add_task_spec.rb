require 'rails_helper'

RSpec.describe "Tasks", type: :feature do
  it "displays new task after successful create" do
    visit new_task_path
    fill_in "Content", with: "new task"
    click_button "Create"

    expect(page).to have_content(/new task/i)
  end

  it "displays edited task after successful edit" do
    Task.create!(id: 1, content: 'New Task')

    visit edit_task_path(1)
    fill_in "Content", with: "edited task"
    click_button "Update"

    expect(page).to have_content(/edited Task/i)
  end 

  it "not displays edited task after successful destroy" do
    Task.create!(id: 1, content: 'new task')
    
    visit tasks_path
    click_link "Destroy"

    expect(page).to_not have_content(/new task/i)
  end 
end