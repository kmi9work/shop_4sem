module ItemPeriodsHelper
  def add_item_period_create_row(create_index, next_index)
    page.insert_html(:before, 'add_item_period',
      render(:partial => 'create',
             :locals => {:create_index => create_index}))
    page.replace_html('add_item_period', render(:partial => 'create_button',
                                    :locals => {:create_index => next_index}))
    
  end
end
