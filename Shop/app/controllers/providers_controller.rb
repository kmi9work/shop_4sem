class ProvidersController < ApplicationController
  layout 'operator_layout'

  def create
  end

  def create_commit
    p = Provider.new
    p.attributes = params['provider']
    p.save
    needs_to_validate(p)
    redirect_to(:action => :list, :user_name => @user)
  end

  def edit
    @item = Provider.find(params[:id])
    redirect_to(:action => :list, :user_name => @user) if @item.nil?
  end

  def edit_commit
    p = Provider.find(params['provider']['id'])
    unless p.nil?
      p.attributes = params['provider']
      p.save
      needs_to_validate(p)
    end
    redirect_to(:action => :list, :user_name => @user)
  end

  def destroy
    p = Provider.find(params[:id])
    p.destroy unless p.nil?
    redirect_to(:action => :list, :user_name => @user)
  end

  def list
    @items = Provider.find(:all)
  end

  def ProvidersController.menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:list, 'Поставщики'], [:create, 'Новый поставщик']]
  end

  def ProvidersController.inline_menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:edit, 'Редактировать'], [:destroy, 'Удалить']]
  end
end
