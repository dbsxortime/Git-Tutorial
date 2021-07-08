package org.project.service;

import java.util.List;

import org.project.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> getReviewList();
	public boolean insertReview(ReviewVO vo);
	public ReviewVO readReview(int r_bno);
	public boolean updateReview(ReviewVO vo);
	public boolean deleteReview(int r_bno);
}
