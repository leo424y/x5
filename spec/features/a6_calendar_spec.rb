require 'rails_helper'

describe "Task with end time on Calendar", type: :feature do
  before(:each) do
    @task1 = @user.tasks.create(content: 'task1', end_time: Time.now)
  end

  it "can be clicked and linked to editing page" do
    visit tasks_path
    click_link 'task1'

    expect(page).to have_content(/Edit/i)
  end
end

