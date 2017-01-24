helpers do
  # Esto deberá de regresar al usuario con una sesión actual si es que existe 
  def current_user
    User.find(session[:id]) if session[:id]
  end

  def logged_in?
      if current_user
        true
      else
        false
      end
    end
  end