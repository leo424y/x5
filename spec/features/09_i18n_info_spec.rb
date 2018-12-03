require 'rails_helper'

RSpec.describe "Translate info to English through en.yml", type: :feature do
  it "displays English text" do
    visit tasks_path

    expect(page).to have_selector("h1", text: "Tasks")
  end

  it "displays English successful info after successful create" do
    visit new_task_path
    fill_in "Content", with: "new task"
    select('todo', from: 'State')
    click_button "Create Task"

    expect(page).to have_content(/Task was successfully created!/i)
  end
end