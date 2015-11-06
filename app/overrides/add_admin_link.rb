Deface::Override.new(:virtual_path  => "spree/shared/_main_nav_bar",
                     :insert_after => "#home-link",
                     :text          => "<% if spree_current_user.try(:admin?) %><li><a href='/admin'>Admin</a></li><% end %>",
                     :name          => "add_admin_link")
