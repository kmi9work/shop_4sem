module ItemsHelper
  def add_row(last_item, next_item)
    page.insert_html(:after, "hash_#{last_item}", 
      render(:partial => 'attribute_row',
             :locals => {:id_num => next_item, :key => '', :value => ''}))
    page.replace_html('add', render(:partial => 'add_attribute_button',
                                    :locals => {:last_item => next_item}))
  end

  def catalogues_list(default = nil, name = 'item[catalogue_id]', onchange = nil)
    cs = Catalogue.find(:all, :order => 'name')
    unless onchange.nil?
      select_tag(name, options_for_select([['', '']] + cs.map{ |c| [c.name, c.id.to_s] },
          default), :onchange => onchange)
    else
      select_tag(name, options_for_select([['', '']] + cs.map{ |c| [c.name, c.id.to_s] },
          default))
    end
  end
end
