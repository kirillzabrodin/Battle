def sign_in_and_play
  visit "/"
  fill_in :p1, with: "Kirill"
  fill_in :p2, with: "Chris"
  click_button "Submit"
end
