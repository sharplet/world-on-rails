module ApplicationHelper
  def pretty_attribute(name)
    case name
    when /(id|gnp)/i
      name.upcase
    else
      name.humanize
    end
  end

  def pretty_value(value)
    case value
    when nil, ''
      '-'
    else
      value
    end
  end

  def nav_pills(current = nil)
    ('<ul class="nav nav-pills">' + nav_list_items(current) + '</ul>').html_safe
  end
  def nav_list_items(current = nil)
    html = ''
    raw_nav_list.each do |item|
      classes = [item[:class]]
      classes << 'active' if item[:name] == current
      html << "<li#{class_attribute(classes)}>"
      html << link_to(item[:name], item[:options])
      html << "</li>"
    end
    html
  end
  def class_attribute(class_list)
    if class_list.size > 0
      " class=\"#{class_list.join(' ')}\""
    end
  end
  def raw_nav_list
    nav_list = [
      {:name => 'Home', :options => root_url}
    ]

    if current_user
      nav_list.concat [
        {:name => 'Log out', :options => '/logout', :class => 'pull-right'}
      ]
    else
      nav_list.concat [
        {:name => 'Sign up', :options => {:controller => 'users', :action => 'new'}, :class => 'pull-right'},
        {:name => 'Log in', :options => '/login', :class => 'pull-right'}
      ]
    end
  end
end
