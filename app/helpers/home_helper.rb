module HomeHelper

  def col_class(i, width_two_indexes)
    width = width_two_indexes.include?(i) ? "is-2": "is-1"
    "column #{width}"
  end

  def content_class(i, width_two_indexes)
    color = i % 2 == 0 ? "is-info": "is-warning"
    color = width_two_indexes.include?(i) ? "is-success" : color
    "notification has-text-right #{color}"
  end

  def icon(i, width_two_indexes)
    icon = width_two_indexes.include?(i) ? "warning" : "arrow-circle-o-right"
    "fa fa-#{icon}"
  end

end