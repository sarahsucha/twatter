require 'spec_helper'

describe "twat_pages/home" do

  it "has an h1" do
    render
    expect(rendered).to have_selector('h1', text: "Sample App")
  end

end
