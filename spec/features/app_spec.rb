require_relative '../../app.rb'

feature "gets names" do
  scenario "Player 1 on the homepage" do
    visit("/")
    expect(page).to have_field('P1:')
  end
  scenario "Player 2 on the homepage" do
    visit("/")
    expect(page).to have_field('P2:')
  end
end

feature "displays name" do
  scenario "Player 1 enters" do
    visit("/")
    fill_in("P1", with: "Kirill")
    click_button("Submit")
    expect(page).to have_content "Kirill"
  end
  scenario "Player 2 enters" do
    visit("/")
    fill_in("P2", with: "Chris")
    click_button("Submit")
    expect(page).to have_content "Chris"
  end
end
