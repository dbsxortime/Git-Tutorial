package org.project.service;

import java.util.List;
import org.project.mapper.QandAMapper;
import org.project.vo.QandAVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class QandAServiceImpl implements QandAService{

	@Setter(onMethod_ = @Autowired)
	private QandAMapper mapper;
	
	@Override
	public List<QandAVO> getQandAList(){
		log.info("getting QandA list... ");
		return mapper.getQandAList();
	}
	
	@Override
	public void insertQandA(QandAVO vo) {
		log.info("insert QandA... : " + vo);
		mapper.insertQandA(vo);
	}
	
	@Override
	public QandAVO readQandA(int q_bno) {
		log.info("read QandA... q_bno = " + q_bno);
		return mapper.readQandA(q_bno);
	}
	
	@Override
	public void deleteQandA(int q_bno) {
		log.info("delete QandA list ... q_bno : " + q_bno);
		mapper.deleteQandA(q_bno);
	}
	
	@Override
	public void updateQandA(QandAVO vo) {
		log.info("update QandA list... : " + vo);
		mapper.updateQandA(vo);
	}

	@Override
	public List<QandAVO> getQandAListWithID(String u_id) {
		log.info("get QandA list with id ... id : " + u_id);
		return mapper.getQandAListWithID(u_id);
	}

	@Override
	public void answer(QandAVO vo) {
		log.info("answer : " + vo.getAnswer());
		mapper.answer(vo);
	}
}