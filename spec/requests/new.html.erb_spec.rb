require 'spec_helper'

describe "products/new.html.erb" do
  subject { page }

  describe "new product" do
    before { visit new_product_path }
    it { should have_field 'product[name]', type: 'text' }
    it { should have_field 'product[ASIN]', type: 'text' }
    it { should have_button 'Create' }
  end
end
