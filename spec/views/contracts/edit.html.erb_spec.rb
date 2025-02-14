require 'rails_helper'

RSpec.describe "contracts/edit", type: :view do
  let(:contract) {
    Contract.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:contract, contract)
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(contract), "post" do

      assert_select "input[name=?]", "contract[name]"

      assert_select "textarea[name=?]", "contract[description]"
    end
  end
end
