require_relative '../../app.rb'

feature "view hit points" do
  scenario "opponents hit points show" do
    sign_in_and_play
    expect(page).to have_content "Kirill: 60HP Chris: 60HP"
  end
end
