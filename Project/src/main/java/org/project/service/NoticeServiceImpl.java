package org.project.service;

import java.util.List;

import org.project.mapper.NoticeMapper;
import org.project.vo.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> getNoticeList() {
		log.info("getting notice list... ");
		return mapper.getNoticeList();
	}

	@Override
	public boolean insertNotice(NoticeVO vo) {
		log.info("insert notice... : "+vo );
		return mapper.insertNotice(vo)==1;
	}

	@Override
	public NoticeVO readNotice(int num) {
		log.info("read notice... num : "+num);
		return mapper.readNotice(num);
	}

	@Override
	public boolean deleteNotice(int num) {
		log.info("delete notice list... num : "+num);
		return mapper.deleteNotice(num)==1;
	}
	
	@Override
	public boolean updateNotice(NoticeVO vo) {
		log.info("update notice list... : "+vo);
		return mapper.updateNotice(vo)==1;
	}
	
}
