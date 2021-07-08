package org.project.service;

import java.util.List;

import org.project.mapper.ReviewMapper;
import org.project.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService{

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getReviewList(){
		log.info("getting Review list... ");
		return mapper.getReviewList();
	}
	
	@Override
	public boolean insertReview(ReviewVO vo) {
		log.info("insert Review..." + vo);
		return mapper.insertReview(vo)==1;
	}
	
	@Override
	public ReviewVO readReview(int r_bno) {
		log.info("read Review... r_bno = " + r_bno);
		return mapper.readReview(r_bno);
	}
	
	@Override
	public boolean deleteReview(int r_bno) {
		log.info("delete Review list ... r_bno : " + r_bno);
		return mapper.deleteReview(r_bno)==1;
	}
	
	@Override
	public boolean updateReview(ReviewVO vo) {
		log.info("update Review list... : " + vo);
		return mapper.updateReview(vo)==1;
	}
}
