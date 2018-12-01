require 'rails_helper'

describe "Task priority sorting", type: :feature do   
  it "can be desc from 1 to 3" do
    @user.tasks.create!(id: 1, content: 'task 1', priority: '1')
    @user.tasks.create!(id: 2, content: 'task 2', priority: '2')

    visit tasks_path
    select('desc', from: 'Priority')
    click_button "Priority Sorting"

    expect(page).to have_content(/task 1 todo 1 Leo Edit Destroy task 2 todo 2 Leo Edit Destroy/i)
  end

  it "can be asc from 3 to 1" do
    @user.tasks.create!(id: 1, content: 'task 1', priority: '1')
    @user.tasks.create!(id: 2, content: 'task 2', priority: '2')

    visit tasks_path
    select('asc', from: 'Priority')
    click_button "Priority Sorting"

    expect(page).to have_content(/task 2 todo 2 Leo Edit Destroy task 1 todo 1 Leo Edit Destroy/)
  end
end