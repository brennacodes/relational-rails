# require 'rails_helper'

# RSpec.describe "/cases", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Case. As you add validations to Case, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   {
  #     "subject" => 'Missing Person',
  #     "uid" => 'a1s2e3a1e5a3d25323135',
  #     "active" => true,
  #     "active_leads" => 123,
  #     "agency" => 1
  #   } 
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Case.create! valid_attributes
  #     get cases_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     case = Case.create! valid_attributes
  #     get case_url(case)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_case_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /edit" do
  #   it "renders a successful response" do
  #     case = Case.create! valid_attributes
  #     get edit_case_url(case)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Case" do
  #       expect {
  #         post cases_url, params: { case: valid_attributes }
  #       }.to change(Case, :count).by(1)
  #     end

  #     it "redirects to the created case" do
  #       post cases_url, params: { case: valid_attributes }
  #       expect(response).to redirect_to(case_url(Case.last))
  #     end
  #   end

    # context "with invalid parameters" do
    #   it "does not create a new Case" do
    #     expect {
    #       post cases_url, params: { case: invalid_attributes }
    #     }.to change(Case, :count).by(0)
    #   end

      # it "renders a successful response (i.e. to display the 'new' template)" do
      #   post cases_url, params: { case: invalid_attributes }
      #   expect(response).to be_successful
      # end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested case" do
  #       case = Case.create! valid_attributes
  #       patch case_url(case), params: { case: new_attributes }
  #       case.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the case" do
  #       case = Case.create! valid_attributes
  #       patch case_url(case), params: { case: new_attributes }
  #       case.reload
  #       expect(response).to redirect_to(case_url(case))
  #     end
  #   end

#     context "with invalid parameters" do
#       it "renders a successful response (i.e. to display the 'edit' template)" do
#         case = Case.create! valid_attributes
#         patch case_url(case), params: { case: invalid_attributes }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "DELETE /destroy" do
#     it "destroys the requested case" do
#       case = Case.create! valid_attributes
#       expect {
#         delete case_url(case)
#       }.to change(Case, :count).by(-1)
#     end

#     it "redirects to the cases list" do
#       case = Case.create! valid_attributes
#       delete case_url(case)
#       expect(response).to redirect_to(cases_url)
#     end
#   end
# end
