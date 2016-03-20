module ApplicationHelper
	#Hiển thị tiêu đề trang Web
	def full_title(page_title = '')
       base_title = "Bài tập thực hành Ruby on rails"
       if page_title.empty?
			base_title
		else
            "#{page_title} | #{base_title}"
       end
    end
end
