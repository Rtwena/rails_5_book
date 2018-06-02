module SessionCounter

  private

  def counter
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def clear_counter
    session[:counter] = nil
  end
end
