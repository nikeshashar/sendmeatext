require 'spec_helper'

  feature "Visitor sends a text" do
    scenario "through the form" do
      visit '/'
      fill_in 'text-box', with: "Howdy site owner, are you free this Friday?"
      fill_in 'phone', with: "00447762432346"
      click_button 'Send Text'
    end

  end

  feature "User adds a new link" do
    scenario "when browsing the homepage" do
      expect(Message.count).to eq(0)
      visit '/'
      add_message("Howdy site owner, are you free this Friday?")
      expect(Message.count).to eq(1)
      message = Message.first
      expect(message.text).to eq("Howdy site owner, are you free this Friday?")
      # expect(message.number).to eq("00447762432346")
    end

    def add_message(text)
      fill_in 'text-box', :with => text
      # fill_in 'phone', :with => number
      click_button 'Send Text'
    end
  end
