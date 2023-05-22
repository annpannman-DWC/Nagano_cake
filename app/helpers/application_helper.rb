module ApplicationHelper
  def order_status_japanese(status)
    case status
    when "pending"
      "未完了"
    when "completed"
      "完了"
    when "cancelled"
      "キャンセル"
    else
      "不明"
    end
  end
end