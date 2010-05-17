class CataloguesController < ApplicationController
  layout 'operator_layout'

  def create
  end

  def create_commit
    c = Catalogue.new
    c.attributes = params['catalogue']
    c.save
    needs_to_validate(c)
    redirect_to(:action => :list, :user_name => @user)
  end

  def edit
    @item = Catalogue.find(params[:id])
    redirect_to(:action => :list, :user_name => @user) if @item.nil?
  end

  def edit_commit
    c = Catalogue.find(params['catalogue']['id'])
    unless c.nil?
      c.attributes = params['catalogue']
      c.save
      needs_to_validate(c)
    end
    redirect_to(:action => :list, :user_name => @user)
  end

  def destroy
    c = Catalogue.find(params[:id])
    c.destroy unless c.nil?
    redirect_to(:action => :list, :user_name => @user)
  end

  def list
    @items = Catalogue.find(:all)
  end

  def CataloguesController.menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:list, 'Каталоги'], [:create, 'Новый каталог']]
  end

  def CataloguesController.inline_menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:edit, 'Редактировать'], [:destroy, 'Удалить']]
  end
end
