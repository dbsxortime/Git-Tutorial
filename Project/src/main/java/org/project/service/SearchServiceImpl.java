package org.project.service;

import java.util.List;

import org.project.mapper.SearchMapper;
import org.project.vo.NoticeVO;
import org.project.vo.ProductVO;
import org.project.vo.QandAVO;
import org.project.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SearchServiceImpl implements SearchService {
   
   @Setter(onMethod_ = @Autowired)
   private SearchMapper mapper;
   
   @Override
   public List<ProductVO> searchProduct(String keyword) {
      log.info("getting notice list... ");
      return mapper.searchProduct(keyword);
   }
   
   @Override
   public List<ProductVO> searchProductWithPrice(SearchVO vo) {
      log.info("getting notice list... ");
      return mapper.searchProductWithPrice(vo);
   }

   @Override
   public List<NoticeVO> searchNoticeWithTitle(String keyword) {
      return mapper.searchNoticeWithTitle(keyword);
   }
   
   @Override
   public List<NoticeVO> searchNoticeWithContext(String keyword) {
      return mapper.searchNoticeWithContext(keyword);
   }

   @Override
   public List<QandAVO> searchQandAWithid(String keyword) {
      return mapper.searchQandAWithid(keyword);
   }

   @Override
   public List<QandAVO> searchQandAWithTitle(String keyword) {
      return mapper.searchQandAWithTitle(keyword);
   }

   @Override
   public List<QandAVO> searchQandAWithContext(String keyword) {
      return mapper.searchQandAWithContext(keyword);
   }

   
   
}