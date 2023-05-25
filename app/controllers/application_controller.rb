class ApplicationController < ActionController::Base

  # before_action :authenticate_customer!, except: [:about,:top]

  before_action :authenticate_any!
    def authenticate_any!
      # (管理者側のログイン制限)urlがadminの判定
      if request.path.match(/\/admin(\/)?/)
       #adminのログイン制限をかける
        authenticate_admin!
      elsif controller_name == 'items' || action_name == 'top' || action_name == 'about'
       #itemコントローラー,top,aboutアクションのいずれかの時にメソッドから抜ける
        return
      else
       #itemコントローラー,top,aboutアクション以外の時、customerのログイン制限をかける
        authenticate_customer!
      end
    end
    
    def ensure_guest_user
      if current_customer.first_name + current_customer.last_name == "guestuser"
        redirect_to customers_mypage_path , notice: 'ゲストユーザーはこの画面へ遷移できません。'
      end
    end

end
