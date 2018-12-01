require 'rails_helper'

describe "Task tags", type: :feature do   

  before(:each) do
    @user.tasks.create(content: 'task1', all_tags: 'a,b,c')
    @user.tasks.create(content: 'task2', all_tags: 'b,c,d')
  end

  it "can links as a task tagging filter" do
    visit tasks_path
    click_link 'd', match: :first

    expect(page).to have_content(/Task with tag: d/i)
  end

  it "can show all tags in task index" do
    visit tasks_path

    expect(page).to have_content(/Tags: a, b, c, d/i)
  end  
end

