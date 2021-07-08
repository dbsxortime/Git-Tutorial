package org.project.mapper;

import java.util.List;

import org.project.vo.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getNoticeList();
	public int insertNotice(NoticeVO vo);
	public NoticeVO readNotice(int num);
	public int deleteNotice(int num);
	public int updateNotice(NoticeVO vo);
}
