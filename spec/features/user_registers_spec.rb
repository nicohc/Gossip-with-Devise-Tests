require 'rails_helper'

=begin


feature "User registers" do

  scenario "inscription valide et affichage index gossip" do

    visit "/"
    click_link "Créer un compte"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Votre pseudo anonymous", with: "bobthp"
    fill_in "email", with: "bob@thp.fr"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
    click_button "Sign up"

    expect(current_path).to eq "/"
    expect(page).to have_content(
      "Voici les derniers gossips"
    )

  end


  context "gossip cachés quand non loggué" do
    visit "/"
    expect(page).to have_content(
      "Voici les derniers gossips"
    )
  end

end
=end
