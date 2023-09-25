class Job::Faking::JobDescriptionService
  def self.call
    create_description
  end

  def self.create_description
    [
      template_1,
      template_2,
      template_3,
      template_4
    ].sample
  end

  def self.template_1
    "<p>Giới thiệu về c&ocirc;ng ty:</p>
                            <p>Khách Hàng Của Chúng Tôi Là Một Công Ty Về Phần Mềm</p>
                            <p><strong>M&Ocirc; TẢ C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>Ph&aacute;t triển các chức năng cho website.</p></li>
                              <li><p>Đảm bảo ho&agrave;n th&agrave;nh c&aacute;c dự &aacute;n đ&uacute;ng như tiến độ được đề ra.</p></li>
                            </ul>
                            <p><strong>Y&Ecirc;U CẦU C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>C&oacute; kinh nghiệm 3 năm trở l&ecirc;n, tiếng anh đọc viết&nbsp;</p></li>
                              <li><p>C&oacute; kinh nghiệm sử dụng một trong c&aacute;c ng&ocirc;n ngữ hướng đối tượng như Java, C++, C# , Ruby, Python&hellip;</p></li>
                              <li><p>C&oacute; khả năng teamwork để phối hợp tốt với team ph&aacute;t triển</p></li>
                              <li><p>C&oacute; Khả năng thích ứng nhanh với công việc ph&aacute;t triển</p></li>
                            </ul>
                            <p><strong>THỜI GIAN L&Agrave;M VIỆC</strong>: 9:00~18:00, từ thứ 2 tới thứ 6 hằng tuần.&nbsp;</p>
                            <p><strong>ĐỊA ĐIỂM L&Agrave;M VIỆC</strong>: Remote</p>
                            <p><strong>QUY TR&Igrave;NH PHỎNG VẤN</strong>: 2 v&ograve;ng (Online)&nbsp;</p>"
  end

  def self.template_2
    "<p>Giới thiệu về c&ocirc;ng ty:</p>
                            <p>Khách Hàng Của Chúng Tôi Là Một Công Ty Về Phần Mềm Nước Ngoài</p>
                            <p><strong>M&Ocirc; TẢ C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>Ph&aacute;t triển các chức năng cho website.</p></li>
                              <li><p>Cải Thiện Lại các chức năng hiện tại.</p></li>
                              <li><p>Đảm bảo ho&agrave;n th&agrave;nh c&aacute;c dự &aacute;n đ&uacute;ng như tiến độ được đề ra.</p></li>
                            </ul>
                            <p><strong>Y&Ecirc;U CẦU C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>C&oacute; kinh nghiệm 4 năm trở l&ecirc;n, tiếng anh đọc viết&nbsp;</p></li>
                              <li><p>C&oacute; kinh nghiệm sử dụng một trong c&aacute;c ng&ocirc;n ngữ hướng đối tượng như Node, Java, C++, C# , Ruby, Python&hellip;</p></li>
                              <li><p>C&oacute; khả năng teamwork để phối hợp tốt với team ph&aacute;t triển</p></li>
                              <li><p>C&oacute; Khả năng thích ứng nhanh với công việc ph&aacute;t triển</p></li>
                              <li><p>Có khả năng tìm hiểu nhanh các công nghệ mới</p></li>
                              <li><p>Có kinh nghiệm làm việc các service</p></li>
                            </ul>
                            <p><strong>THỜI GIAN L&Agrave;M VIỆC</strong>: 9:00~18:00, Thứ 2 tới thứ 6 hằng tuần.&nbsp;</p>
                            <p><strong>ĐỊA ĐIỂM L&Agrave;M VIỆC</strong>: Remote Online</p>
                            <p><strong>QUY TR&Igrave;NH PHỎNG VẤN</strong>: 2 v&ograve;ng (Online)&nbsp;</p>"
  end

  def self.template_3
    "<p>Giới thiệu về c&ocirc;ng ty:</p>
                            <p>Khách Hàng Của Chúng Tôi Là Một Công Ty Về Phần Mềm Đến Từ Châu Âu</p>
                            <p><strong>M&Ocirc; TẢ C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>Ph&aacute;t triển các chức năng cho website.</p></li>
                              <li><p>Đảm bảo ho&agrave;n th&agrave;nh c&aacute;c dự &aacute;n đ&uacute;ng như tiến độ được đề ra.</p></li>
                            </ul>
                            <p><strong>Y&Ecirc;U CẦU C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>C&oacute; kinh nghiệm 3 năm trở l&ecirc;n, tiếng anh đọc viết&nbsp;</p></li>
                              <li><p>C&oacute; kinh nghiệm sử dụng một trong c&aacute;c ng&ocirc;n ngữ hướng đối tượng như Java, C++, C# , Ruby, Python&hellip;</p></li>
                              <li><p>C&oacute; khả năng teamwork để phối hợp tốt với team ph&aacute;t triển</p></li>
                              <li><p>C&oacute; Khả năng thích ứng nhanh với công việc ph&aacute;t triển</p></li>
                            </ul>
                            <p><strong>THỜI GIAN L&Agrave;M VIỆC</strong>: 9:00~18:00, từ thứ 2 tới thứ 6 hằng tuần.&nbsp;</p>
                            <p><strong>ĐỊA ĐIỂM L&Agrave;M VIỆC</strong>: Remote</p>
                            <p><strong>QUY TR&Igrave;NH PHỎNG VẤN</strong>: 2 v&ograve;ng (Online)&nbsp;</p>"
  end

  def self.template_4
    "<p>Giới thiệu về c&ocirc;ng ty:</p>
                            <p>Khách Hàng Của Chúng Tôi Là Một Công Ty Về Phần Mềm Đến Từ Úc</p>
                            <p><strong>M&Ocirc; TẢ C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>Ph&aacute;t triển các chức năng cho website.</p></li>
                              <li><p>Đảm bảo ho&agrave;n th&agrave;nh c&aacute;c dự &aacute;n đ&uacute;ng như tiến độ được đề ra.</p></li>
                            </ul>
                            <p><strong>Y&Ecirc;U CẦU C&Ocirc;NG VIỆC&nbsp;</strong></p>
                            <ul>
                              <li><p>C&oacute; kinh nghiệm 3 năm trở l&ecirc;n, tiếng anh đọc viết&nbsp;</p></li>
                              <li><p>C&oacute; kinh nghiệm sử dụng một trong c&aacute;c ng&ocirc;n ngữ hướng đối tượng như Java, C++, C# , Ruby, Python&hellip;</p></li>
                              <li><p>C&oacute; khả năng teamwork để phối hợp tốt với team ph&aacute;t triển</p></li>
                              <li><p>C&oacute; Khả năng thích ứng nhanh với công việc ph&aacute;t triển</p></li>
                              <li><p>Có kinh nghiệm làm việc với khách nước ngoài</p></li>
                            </ul>
                            <p><strong>THỜI GIAN L&Agrave;M VIỆC</strong>: 9:00~18:00, từ thứ 2 tới thứ 6 hằng tuần.&nbsp;</p>
                            <p><strong>ĐỊA ĐIỂM L&Agrave;M VIỆC</strong>: Remote</p>
                            <p><strong>QUY TR&Igrave;NH PHỎNG VẤN</strong>: 2 v&ograve;ng (Online)&nbsp;</p>"
  end
end
