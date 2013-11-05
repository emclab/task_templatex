module TaskTemplatex
  class Template < ActiveRecord::Base
    
    attr_accessible :active, :instruction, :last_updated_by_id, :name, :type_id, :ranking_order, :template_items_attributes, :as => :role_new
    attr_accessible :active, :instruction, :last_updated_by_id, :name, :type_id, :ranking_order, :template_items_attributes, :as => :role_update
    
    belongs_to :type, :class_name => TaskTemplatex.type_class.to_s
    belongs_to :last_updated_by, :class_name => 'Authentify::User' 
    has_many :template_items, :class_name => 'TaskTemplatex::TemplateItem'
    accepts_nested_attributes_for :template_items, :allow_destroy => true  #data validate in task_template model
       
    validates :type_id, :presence => true,
                        :numericality => {:greater_than => 0}
    validates :name, :presence => true,
                     :uniqueness => { :case_sensitive => false, :message => 'Duplicate Name' }  
  end
end
