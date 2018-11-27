require 'rails_helper'

RSpec.describe "Tasks", type: :feature do
  it "displays new task after successful create" do
    visit new_task_path
    fill_in "Content", with: "new task"
    click_button "Create Task"

    expect(page).to have_selector("td", text: "new task")
  end

  it "displays new task after unsuccessful create" do
    visit new_task_path
    fill_in "Content", with: "new task"
    click_button "Create Task"

    expect(page).to have_selector("td", text: "new task")
  end

  it "displays edited task after successful edit" do
    Task.create!(id: 1, content: 'new task')

    visit edit_task_path(1)
    fill_in "Content", with: "edited task"
    click_button "Update Task"

    expect(page).to have_selector("td", text: "edited task")
  end 

  it "not displays edited task after successful destroy" do
    Task.create!(id: 1, content: 'new task')
    
    visit tasks_path
    click_link "Destroy"

    expect(page).to_not have_selector("td", text: "new task")
  end 
end