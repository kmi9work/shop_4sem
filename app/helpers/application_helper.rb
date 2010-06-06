# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def menu_item_tag(link, name)
    return "<DIV class = \"menu-item\"><A HREF = \"#{link}\">#{name}</A></DIV>"
  end

  def used_controllers(user_class)
    case user_class
    when 'operator'
      [CataloguesController, StoragesController, ProvidersController,
        ItemsController]
    else
      [ItemsController]
    end
  end

  def menu(user_class)
    used_controllers(user_class).inject([]) do |res, c|
      cname = c.controller_name
      unless cname == params[:controller]
        si = c.menu_items(user_class).first
        unless si.nil?
          res << [url_for(:controller => cname, :action => si[0]), si[1]]
        end
      else
        c.menu_items(user_class).each do |si|
          res << [url_for(:controller => cname, :action => si[0]), si[1]]
        end
      end
      res
    end
  end

  def create_menu(user_class)
    menu(user_class).map{ |i| menu_item_tag(*i) }.join("\n")
  end

  def inline_menu(id, inline_actions = nil)
    inline_actions = @inline_actions if inline_actions.nil?
    if inline_actions.size > 0
      inline_actions.map do |a|
        link = link_to(a[1], :action => a[0], :id => id) 
        link = link_to(a[1], :action => a[0], :id => id, :controller => a[2]) unless a[2].nil?          
        content_tag(:span, link, :class => 'inline-menu-item') 
      end
    else
      ''
    end
  end

  def empty_list()
    content_tag(:thead, content_tag(:tr, content_tag(:th, 'Объектов не найдено!')))
  end

  def display_error()
    content_tag(:ul, @errors.map do |e|
        content_tag(:li, "Ошибка записи в поле #{e[0]}: #{e[1]}")
      end)
  end
end
