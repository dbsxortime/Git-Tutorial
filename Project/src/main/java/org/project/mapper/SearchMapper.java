package org.project.mapper;

import java.util.List;

import org.project.vo.NoticeVO;
import org.project.vo.ProductVO;
import org.project.vo.QandAVO;
import org.project.vo.SearchVO;

public interface SearchMapper {
   public List<ProductVO> searchProduct(String keyword);
   public List<ProductVO> searchProductWithPrice(SearchVO vo);
   public List<NoticeVO> searchNoticeWithTitle(String keyword);
   public List<NoticeVO> searchNoticeWithContext(String keyword);
   
   public List<QandAVO> searchQandAWithid(String keyword);
   public List<QandAVO> searchQandAWithTitle(String keyword);
   public List<QandAVO> searchQandAWithContext(String keyword);
   
   
}