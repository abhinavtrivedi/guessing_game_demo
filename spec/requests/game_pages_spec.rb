require 'spec_helper'

describe "GamePages" do
  describe "Index Page" do
    it "should have the form" do
      get root_path
      expect(page).to have_button 'Save Game'
    end
  end
end
