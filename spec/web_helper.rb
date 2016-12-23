def sign_in
  visit('/')
  click_link('Sign In')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Sign in')
end

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign Out')
end

def create_new_group
  click_link("Create New Group")
  fill_in 'Name', with: "Fight Club"
  fill_in 'Description', with: "You do not talk about fight club!"
  click_button("Create Group")
end
