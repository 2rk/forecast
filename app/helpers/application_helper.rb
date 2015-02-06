module ApplicationHelper
  def date_display date
    if date
      date.strftime('%d/%m/%Y')
    end
  end

  def datetime_display date
    if date
      date.strftime('%d/%m/%Y %H:%M')
    end
  end
end
