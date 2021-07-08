package org.project.service;

import java.util.List;

import org.project.vo.QandAVO;

public interface QandAService {
	public List<QandAVO> getQandAList();
	public void insertQandA(QandAVO vo);
	public QandAVO readQandA(int q_bno);
	public void updateQandA(QandAVO vo);
	public void deleteQandA(int q_bno);
	public List<QandAVO> getQandAListWithID(String u_id);
	public void answer(QandAVO vo);
}