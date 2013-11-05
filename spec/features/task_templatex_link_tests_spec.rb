require 'spec_helper'

describe "LinkTests" do
  describe "GET /task_templatex_link_tests" do
    mini_btn = 'btn btn-mini '
    ActionView::CompiledTemplates::BUTTONS_CLS =
        {'default' => 'btn',
         'mini-default' => mini_btn + 'btn',
         'action'       => 'btn btn-primary',
         'mini-action'  => mini_btn + 'btn btn-primary',
         'info'         => 'btn btn-info',
         'mini-info'    => mini_btn + 'btn btn-info',
         'success'      => 'btn btn-success',
         'mini-success' => mini_btn + 'btn btn-success',
         'warning'      => 'btn btn-warning',
         'mini-warning' => mini_btn + 'btn btn-warning',
         'danger'       => 'btn btn-danger',
         'mini-danger'  => mini_btn + 'btn btn-danger',
         'inverse'      => 'btn btn-inverse',
         'mini-inverse' => mini_btn + 'btn btn-inverse',
         'link'         => 'btn btn-link',
         'mini-link'    => mini_btn +  'btn btn-link'
        }
    before(:each) do
      @pagination_config = FactoryGirl.create(:engine_config, :engine_name => nil, :engine_version => nil, :argument_name => 'pagination', :argument_value => 30)
      z = FactoryGirl.create(:zone, :zone_name => 'hq')
      type = FactoryGirl.create(:group_type, :name => 'employee')
      ug = FactoryGirl.create(:sys_user_group, :user_group_name => 'ceo', :group_type_id => type.id, :zone_id => z.id)
      @role = FactoryGirl.create(:role_definition)
      ur = FactoryGirl.create(:user_role, :role_definition_id => @role.id)
      ul = FactoryGirl.build(:user_level, :sys_user_group_id => ug.id)
      @u = FactoryGirl.create(:user, :user_levels => [ul], :user_roles => [ur])
      @proj_type = FactoryGirl.create(:simple_typex_type)
      @proj_type1 = FactoryGirl.create(:simple_typex_type, :name => 'newnew')
      @task = FactoryGirl.create(:commonx_misc_definition, :for_which => 'task_definition')
      
      ua1 = FactoryGirl.create(:user_access, :action => 'index', :resource => 'task_templatex_templates', :role_definition_id => @role.id, :rank => 1,
           :sql_code => "TaskTemplatex::Template.where(:active => true).order('created_at DESC')")
      ua1 = FactoryGirl.create(:user_access, :action => 'create', :resource => 'task_templatex_templates', :role_definition_id => @role.id, :rank => 1,
           :sql_code => "")
      ua1 = FactoryGirl.create(:user_access, :action => 'update', :resource => 'task_templatex_templates', :role_definition_id => @role.id, :rank => 1,
           :sql_code => "")
      user_access = FactoryGirl.create(:user_access, :action => 'show', :resource =>'task_templatex_templates', :role_definition_id => @role.id, :rank => 1,
        :sql_code => "")
      ua41 = FactoryGirl.create(:user_access, :action => 'create_task_definition', :resource => 'commonx_misc_definitions', :role_definition_id => @role.id, :rank => 1,
                                :sql_code => "")  
      visit '/'
      #save_and_open_page
      fill_in "login", :with => @u.login
      fill_in "password", :with => 'password'
      click_button 'Login' 
    end
    
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      t = FactoryGirl.create(:task_templatex_template, :type_id => @proj_type.id)
      visit templates_path
      #save_and_open_page
      page.should have_content('Templates')
      click_link('Edit')
      #save_and_open_page
      page.should have_content('Update Template')
      
      visit templates_path
      click_link(@task.id.to_s)
      #save_and_open_page
      page.should have_content('Template Info')
      click_link 'New Template'
      page.should have_content('New Template')
      #save_and_open_page
    end
  end
end
