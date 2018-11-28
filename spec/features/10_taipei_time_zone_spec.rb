require 'rails_helper'

RSpec.describe "Timezone", type: :feature do
  it "is Asia/Taipei" do
    expect(Rails.application.config.time_zone).to eql('Asia/Taipei')
  end
end