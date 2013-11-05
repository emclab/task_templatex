require 'spec_helper'

module TaskTemplatex
  describe Template do
    it "should be OK" do
      c = FactoryGirl.build(:task_templatex_template)
      c.should be_valid
    end
    
    it "should reject nil name" do
      c = FactoryGirl.build(:task_templatex_template, :name => nil)
      c.should_not be_valid
    end
    
    it "should reject nil type_definition id" do
      c = FactoryGirl.build(:task_templatex_template, :type_id => nil)
      c.should_not be_valid
    end
    
    it "should reject duplicate name " do
      c1 = FactoryGirl.create(:task_templatex_template)
      c2 = FactoryGirl.build(:task_templatex_template, :instruction => 'a dup cate name')
      c2.should_not be_valid
    end
  end
end
