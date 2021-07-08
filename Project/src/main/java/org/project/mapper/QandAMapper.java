package org.project.mapper;

import java.util.List;

import org.project.vo.CartVO;
import org.project.vo.QandAVO;
import org.project.vo.TransactionVO;

public interface QandAMapper {
	public List<QandAVO> getQandAList();
	public void insertQandA(QandAVO vo);
	public QandAVO readQandA(int num);
	public void updateQandA(QandAVO vo);
	public void deleteQandA(int num);
	public List<QandAVO> getQandAListWithID(String u_id);
	public void answer(QandAVO vo);
}