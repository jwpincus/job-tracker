require 'rails_helper'

describe "User edits a job" do
  scenario "a user can edit an existing job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Development")
    job = company.jobs.create!(title: "Dev", description: "developing", level_of_interest: 57, city: "Denver", category_id: category.id)



    visit company_job_path(company, job)
    click_link_or_button "Delete"
    expect(page).to have_no_content("Developer")

  end
end
