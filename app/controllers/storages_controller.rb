class StoragesController < ApplicationController
  layout 'operator_layout'

  def list
    @items = Storage.find(:all)
  end

  def create
  end

  def create_commit
    s = Storage.new
    s.attributes = params['storage']
    s.save
    needs_to_validate(s)
    redirect_to(:action => :list, :user_name => @user)
  end

  def edit
    @item = Storage.find(params[:id])
    redirect_to(:action => :list, :user_name => @user) if @item.nil?
  end

  def edit_commit
    s = Storage.find(params['storage']['id'])
    unless s.nil?
      s.attributes = params['storage']
      s.save
      needs_to_validate(s)
    end
    redirect_to(:action => :list, :user_name => @user)
  end

  def destroy
    s = Storage.find(params[:id])
    s.destroy
    redirect_to(:action => :list, :user_name => @user)
  end

  def StoragesController.menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:list, 'Склады'], [:create, 'Новый склад']]
  end

  def StoragesController.inline_menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:edit, 'Редактировать'], [:destroy, 'Удалить']]
  end
end
