require 'rails_helper'

describe "Sorting", type: :feature do   
  it "should be most recently published first" do
    Task.create!(content:'3', end_time: '2018-11-05T04:00')
    Task.create!(content:'1', end_time: '2018-11-05T01:00')
    Task.create!(content:'2', end_time: '2018-11-05T05:00')

    tasks = Task.in_end_time_desc.all

    visit tasks_path

    expect(tasks.first.content).to eql '2'
  end

  it "should be oldest published last" do
    Task.create!(content:'3', end_time: '2018-11-05T04:00')
    Task.create!(content:'1', end_time: '2018-11-05T01:00')
    Task.create!(content:'2', end_time: '2018-11-05T05:00')

    tasks = Task.in_end_time_desc.all

    visit tasks_path

    expect(tasks.last.content).to eql '1'
  end
end