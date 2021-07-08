package org.project.mapper;

import java.util.List;

import org.project.vo.ReviewVO;

public interface ReviewMapper {
	public List<ReviewVO> getReviewList();
	public int insertReview(ReviewVO vo);
	public ReviewVO readReview(int num);
	public int updateReview(ReviewVO vo);
	public int deleteReview(int num);
}
