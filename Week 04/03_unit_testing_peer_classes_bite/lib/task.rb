class Task
  def initialize(title)
    fail "Please enter a String!" if title.class != String
    @title = title
    @complete = false
  end

  def title
    return @title
  end

  def mark_complete
    @complete = true
  end

  def complete?
    return @complete
  end
end
