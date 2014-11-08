require 'spec_helper'

  feature "Visitor sends a text" do
    scenario "through the form" do
      visit '/'
      fill_in 'text-box', with: "Howdy site owner, are you free this Friday?"
      fill_in 'phone', with: "00447762432346"
    end

  end
