class ProvidingsController < ApplicationController
  layout 'operator_layout'

  def create
    @item = Item.find(params['id'])
  end

  def create_commit
    p = Providing.new
    p.attributes = params['providing']
    p.save
    needs_to_validate(p)
    unless params.include?('providing') or params['providing'].include?('item_id')
      redirect_to(:action => :list, :controller => :items, :user_name => @user)
    end
    redirect_to(:action => :list, :id => params['providing']['item_id'], :user_name => @user)
  end

  def edit
    @item = Providing.find(params[:id])
    redirect_to(:action => :list, :controller => :items, :user_name => @user) if @item.nil?
  end

  def edit_commit
    p = Providing.find(params[:id])
    unless p.nil?
      p.attributes = params['providing']
      p.save
      needs_to_validate(p)
    end
    unless params.include?('providing') or params['providing'].include?('item_id')
      redirect_to(:action => :list, :controller => :items, :user_name => @user)
    end
    redirect_to(:action => :list, :id => params['providing']['item_id'], :user_name => @user)
  end

  def list
    return if params[:id].blank?
    @item = Item.find(params[:id])
    @items = Providing.find(:all, :conditions => ['item_id = ?', params[:id]],
      :include => [:provider], :order => ['providing_date'])
  end

  def destroy
    p = Providing.find(params[:id])
    id = nil
    unless p.nil?
      id = p.item.id
      p.destroy
    end
    redirect_to(:action => :list, :id => id, :user_name => @user)
  end

  def ProvidingsController.menu_items(user_class)
    return [] unless user_class == 'operator'
    return []
  end

  def ProvidingsController.inline_menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:edit, 'Редактировать'], [:destroy, 'Удалить']]
  end
end
