require_dependency "task_templatex/application_controller"

module TaskTemplatex
  class TemplatesController < ApplicationController
    before_filter :require_employee
    before_filter :load_type

    def index
      @title = 'Templates'
      @templates = params[:task_templatex_templates][:model_ar_r]
      @templates = @templates.where(:type_id => params[:type_id]) if @type
      @templates = @templates.page(params[:page]).per_page(@max_pagination) 
    end
  
    def new
      @title = 'New Template'
      @template = TaskTemplatex::Template.new()
      @template.template_items.build()
    end
  
    def create
      @template = TaskTemplatex::Template.new(params[:template], :as => :role_new)
      @template.last_updated_by_id = session[:user_id]
      if @template.save
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Saved!")
      else
        flash.now[:error] = t('Data Error. Not Saved!')
        render 'new'
      end
    end
  
    def edit
      @title = 'Edit Template'
      @template = TaskTemplatex::Template.find_by_id(params[:id])
    end
  
    def update
      @template = TaskTemplatex::Template.find_by_id(params[:id])
      @template.last_updated_by_id = session[:user_id]
      if @template.update_attributes(params[:template], :as => :role_update)
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Updated!")
      else
        flash.now[:error] = t('Data Error. Not Updated!')
        render 'edit'
      end
    end
  
    def show
      @title = 'Template Info'
      @template = TaskTemplatex::Template.find_by_id(params[:id])
    end
    
    protected
    def load_type
      @type = TaskTemplatex.type_class.find_by_id(params[:type_id]) if params[:type_id].present?
    end
    
  end
end
