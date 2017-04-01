require 'rails_helper'

describe "User edits a job" do
  scenario "a user can edit an existing job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    job = company.jobs.create!(title: "Dev", description: "developing", level_of_interest: 57, city: "Denver", category_id: category.id)



    visit company_job_path(company, job)
    click_link_or_button "Edit"
    fill_in "job[title]", with: "Not Developer"
    fill_in "job[description]", with: "fun!"
    fill_in "job[level_of_interest]", with: 56
    fill_in "job[city]", with: "Denver"
    click_button "Update Job"
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Not Developer")
    expect(page).to have_content("56")
    expect(page).to have_content("Denver")

  end
end
