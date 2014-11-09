require 'spec_helper'
  
  feature "Text gets sent" do
    scenario "after user entered data in the form" do
      visit '/'
      add_message("Howdy site owner, are you free this Friday?", "00447762432346")
      expect(current_path).to eq '/sent'
      expect(page).to have_content("Your message was sent!")
    end
  end
