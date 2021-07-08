package org.project.service;

import java.util.List;

import org.project.vo.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getNoticeList();
	public boolean insertNotice(NoticeVO vo);
	public NoticeVO readNotice(int num);
	public boolean updateNotice(NoticeVO vo);
	public boolean deleteNotice(int num);
}
