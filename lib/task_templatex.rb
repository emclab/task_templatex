require "task_templatex/engine"

module TaskTemplatex
  mattr_accessor :type_class
  
  def self.type_class
    @@type_class.constantize
  end
end
