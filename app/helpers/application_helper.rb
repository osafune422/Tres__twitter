module ApplicationHelper
    def show_time(time)
        time.strftime("%H:%M-%Y年%m月%d日")
    end
    
    def createuser_time(time)
        time.strftime("%Y年%m月に登録")
    end
end
