require 'rails_helper'

describe "Task priority sorting", type: :feature do   
  it "can be desc from 1 to 3" do
    Task.create!(id: 1, content: 'task 1', priority: '1')
    Task.create!(id: 2, content: 'task 2', priority: '2')

    visit tasks_path
    select('desc', from: 'Priority')
    click_button "Priority Sorting"

    expect(page).to have_content(/Tasks\ntodo doing done\ndesc asc\nContent End Time State Priority task 1 todo 1 Edit Destroy task 2 todo 2 Edit Destroy/i)
  end

  it "can be asc from 3 to 1" do
    Task.create!(id: 1, content: 'task 1', priority: '1')
    Task.create!(id: 2, content: 'task 2', priority: '2')

    visit tasks_path
    select('asc', from: 'Priority')
    click_button "Priority Sorting"

    expect(page).to have_content(/Tasks\ntodo doing done\ndesc asc\nContent End Time State Priority task 2 todo 2 Edit Destroy task 1 todo 1 Edit Destroy/i)
  end
end