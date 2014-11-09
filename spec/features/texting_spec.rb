require 'spec_helper'

  feature "Text gets sent" do
    scenario "after user entered data in the form" do
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
      expect(current_path).to eq '/sent'
      expect(page).to have_content("Your message was sent!")
    end

  end

  feature "Business owner can reply" do
    scenario "after receiving a text" do
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
      site_owner_phone = Phone.new
      expect(site_owner_phone.received_message).to eq "Sure, I'm free!"
    end
end
