class ItemStoragesController < ApplicationController
  def ItemStoragesController.inline_menu_items(user_class)
    return [] unless user_class == 'operator'
    return [[:destroy, 'X']]
  end

  def create
    create_index = params[:create_index]
    return if create_index.blank?
    next_index = (create_index.to_i + 1).to_s
    render(:update) do |page|
      page.add_item_storage_create_row(create_index, next_index)
    end
  end
end
