require 'rails_helper'

describe "Sorting", type: :feature do   
  it "should be most recently published first" do
    Task.create!(content:'3')
    Task.create!(content:'1')
    Task.create!(content:'2')

    tasks = Task.in_desc.all

    visit tasks_path

    expect(tasks.first.content).to eql '2'
  end

  it "should be oldest published last" do
    Task.create!(content:'3')
    Task.create!(content:'1')
    Task.create!(content:'2')

    tasks = Task.in_desc.all

    visit tasks_path

    expect(tasks.last.content).to eql '3'
  end
end