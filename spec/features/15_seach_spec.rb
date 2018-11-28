require 'rails_helper'

describe "Task Search bar", type: :feature do   
  it "can search content with string" do
    Task.create!(id: 1, content: 'new task')

    visit tasks_path
    fill_in "Content", with: 'new'
    click_button "Search"

    expect(page).to have_content(/new task/i)
  end

  it "wont search content without string" do
    Task.create!(id: 1, content: 'new task')

    visit tasks_path
    fill_in "Content", with: 'x'
    click_button "Search"

    expect(page).not_to have_content(/new task/i)
  end
   
  it "can search content with state" do
    Task.create!(id: 1, content: 'doing task', state: 'doing')

    visit tasks_path
    select('doing', from: 'State')
    click_button "Search"

    expect(page).to have_content(/doing task/i)
  end
   
  it "won't search content without state" do
    Task.create!(id: 1, content: 'doing task', state: 'todo')

    visit tasks_path
    select('doing', from: 'State')
    click_button "Search"

    expect(page).not_to have_content(/doing task/i)
  end
end