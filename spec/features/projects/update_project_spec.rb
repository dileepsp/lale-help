require 'rails_helper'

describe "Update project", type: :feature, js: true do

  let(:circle)    { create(:circle, :with_admin) }
  let(:admin)     { circle.admin }

  let(:working_group) { create(:public_working_group, circle: circle, admin: admin) }
  let(:project) { create(:project, working_group: working_group) }

  context "when on edit project page" do
    
    before { visit edit_circle_project_path(id: project, circle_id: circle, as: admin) }

    let(:project_form) { PageObject::ProjectForm.new }

    context "when all mandatory fields are filled" do
      let(:project_attributes) { {name: "New project name"} }
      it "updates the project" do
        project_page = project_form.submit_with(project_attributes)
        expect(project_page).to have_name(project_attributes[:name])
      end
    end

    context "when name is empty" do
      let(:project_attributes) { {name: ""} }
      it "shows an error message" do
        project_form.submit_with(project_attributes)
        expect(project_form).to be_invalid
        expect(project_form).to have_validation_error("Name can't be empty")
      end
    end
  end


end