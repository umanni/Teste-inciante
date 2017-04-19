require "rails_helper"

RSpec.feature "Logged User Features" do

  before do
    @bruno = User.create(email: "bruno@example.com", password: "password")
    @lucas = User.create(email: "lucas@example.com", password: "password")
    @lucas_post = Post.create(title: "Second Post", body: "Lorem ipsum.", description: "Lorem ipsum", banner_image_url:"img_2_jpg", user: @lucas)
  end
  
  scenario "- As a logged user I can create posts" do
    login_as(@bruno)

    visit "/"
    
    click_link "New Post"
    
    fill_in "post[title]", with: "Creating a blog"
    fill_in "post[body]", with: "Lorem Ipsum"
    fill_in "post[banner_image_url]", with: "http://lorempixel.com/400/200/"
    fill_in "post[description]", with: "Lorem Ipsum"


    click_button "Create Post"
    
    expect(Post.last.user).to eq(@bruno)
    expect(page).to have_content("Post was successfully created.")
  end
  
  scenario "- A logged user fails to create a new post" do
    login_as(@bruno)

    visit "/"
    
    click_link "New Post"
    
    fill_in "post[title]", with: ""
    fill_in "post[body]", with: ""
    fill_in "post[banner_image_url]", with: ""
    fill_in "post[description]", with: ""
    
    click_button "Create Post"
    
    expect(page).to have_content("4 errors prohibited this post from being saved:")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Banner image url can't be blank")
  end

  scenario "- As a logged user I can edit only my posts" do
    login_as(@lucas)

    visit "/"
    
    click_link @lucas_post.title
    
    click_link "Edit"

    fill_in "post[title]", with: "Creating a blog"
    fill_in "post[body]", with: "Lorem Ipsum"
    fill_in "post[banner_image_url]", with: "http://lorempixel.com/400/200/"
    fill_in "post[description]", with: "Lorem Ipsum"
    
    click_button "Update Post"

    expect(page).to have_content("Post was successfully updated.")
  end
  
  scenario "- To non-owner hide the Edit and Delete buttons" do
    login_as(@bruno)
    
    visit "/"
    
    click_link @lucas_post.title
    
    expect(page).to have_content(@lucas_post.title)
    expect(page).to have_content(@lucas_post.description)
   
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end
end