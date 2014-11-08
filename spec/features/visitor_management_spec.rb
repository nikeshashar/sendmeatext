require 'spec_helper'

    def add_message(text, number)
      fill_in 'text-box', :with => text
      fill_in 'phone-number', :with => number
      click_button 'Send Text'
    end
  
  feature "Visitor can input a message" do
    scenario "through the form" do
      visit '/'
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
    end

  end

  feature "Information saved to the database" do
    scenario "text message content saved" do
      expect(Message.count).to eq(0)
      visit '/'
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
      expect(Message.count).to eq(1)
      message = Message.first
      expect(message.text).to eq("Howdy site owner, are you free this Friday?")
    end

    scenario "phone number saved" do
      expect(Exchange.count).to eq(0)
      visit '/'
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
      expect(Exchange.count).to eq(1)
      exchange = Exchange.first
      expect(exchange.visitor_phone).to eq("00447762432346")
    end

  end
