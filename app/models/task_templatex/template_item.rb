module TaskTemplatex
  class TemplateItem < ActiveRecord::Base
    attr_accessible :brief_note, :execution_order, :execution_sub_order, :need_request, :template_id, :start_before_previous_completed, 
                    :task_definition_id,
                    :as => :role_new
    attr_accessible :brief_note, :execution_order, :execution_sub_order, :need_request, :template_id, :start_before_previous_completed, 
                    :task_definition_id,
                    :as => :role_update                 
    
    belongs_to :template, :class_name => 'TaskTemplatex::Template'
    belongs_to :last_updated_by, :class_name => 'Authentify::User' 
    belongs_to :task_definition, :class_name => 'Commonx::MiscDefinition'
    
    validates :execution_order, :presence => true,
                                :numericality => {:greater_than => 0, :message => I18n.t('Must > 0')}
    validates :task_definition_id, :presence => true,
                                   :numericality => {:greater_than => 0},
                                   :uniqueness => {:scope => :template_id, :message => I18n.t('Duplicate Template!')}
  end
end
