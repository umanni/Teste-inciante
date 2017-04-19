require "rails_helper"

RSpec.feature "Visitor Features" do
  
  before do
    @bruno = User.create(email: "bruno@example.com", password: "password")
    @post1 = Post.create(title: "My first post", body: "Lorem ipsum.", description: "Lorem ipsum.", banner_image_url:"img_1_jpeg", user: @bruno)
    @post2 = Post.create(title: "Second Post", body: "Lorem ipsum.", description: "Lorem ipsum", banner_image_url:"img_2_jpg", user: @bruno)
  end
  
  scenario "- A visitor can see all posts, but can't create a post." do 
    
    visit "/"
    
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post1.description)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post2.description)
    expect(page).to have_link(@post1.title)
    expect(page).to have_link(@post2.title)

    expect(page).not_to have_link("New Post")
    
  end

  scenario "- As a visitor, I can register myself as a User to create posts" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    
    expect(page).to have_content("You have signed up successfully.")

    expect(page).to have_link("New Post")
  end
end