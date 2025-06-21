require "rails_helper"

RSpec.describe MonthlyExpensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/monthly_expenses").to route_to("monthly_expenses#index")
    end

    it "routes to #show" do
      expect(get: "/monthly_expenses/1").to route_to("monthly_expenses#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/monthly_expenses").to route_to("monthly_expenses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/monthly_expenses/1").to route_to("monthly_expenses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/monthly_expenses/1").to route_to("monthly_expenses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/monthly_expenses/1").to route_to("monthly_expenses#destroy", id: "1")
    end
  end
end
