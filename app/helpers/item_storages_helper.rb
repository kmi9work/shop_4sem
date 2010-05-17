module ItemStoragesHelper
  def storage_select(name, selected)
    select_tag(name, 
      options_for_select(Storage.find(:all, :order => ['name']).map do |s|
          [s.name, s.id]
        end, selected))
  end

  def add_item_storage_create_row(create_index, next_index)
    page.insert_html(:before, 'add_item_storage',
      render(:partial => 'create',
             :locals => {:create_index => create_index}))
    page.replace_html('add_item_storage', render(:partial => 'create_button',
                                    :locals => {:create_index => next_index}))

  end
end
