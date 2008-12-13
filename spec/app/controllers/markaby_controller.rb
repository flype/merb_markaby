class MarkabyController < Merb::Controller
  self._template_root = File.join(File.dirname(__FILE__), "..", "views")
  def index
    render
  end
end

class MarkabyPartial < MarkabyController
  def index
    render
  end
end

class MarkabyPartialLocalsHash < MarkabyController
  def index
    @how_much = "extremely"
    @to_what  = "Markaby"
    render
  end
end

class MarkabyViewIvar < MarkabyController
  def index
    @how_much = "really"
    @to_what  = "Markaby"
    render
  end
end

class MarkabyPartialWithAsSingle < MarkabyController
  def index
    @how_much = "super"
    @to_what  = "Markaby"
    render
  end
end

class MarkabyPartialWithAsArray < MarkabyController
  def index
    @how_much = %w(really very extremely super)
    @to_what  = "Markaby"
    render
  end
end

class MarkabyCapture < MarkabyController
  def index
    render
  end
end
