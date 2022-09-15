package com.bjh.withus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjh.withus.mapper.PhotoMapper;
import com.bjh.withus.vo.Photo;

@Service
@Transactional
public class PhotoService {
	@Autowired
	PhotoMapper photoMapper;
	
	public Map<String,Object> getPhotoList(int currentPage, int ROW_PER_PAGE){
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = 0;
		int displayPage = 5;
		int startPage = 0;
		int lastPage = 0;
		
		beginRow = (currentPage-1)*ROW_PER_PAGE;
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		List<Photo> photoList = photoMapper.selectPhotoList(paramMap);
		
		startPage = ((currentPage - 1) / displayPage) * displayPage + 1;
		
		int totalCount = photoMapper.selectPhotoTotalCount();
		
		lastPage = startPage + displayPage - 1;
		int totalPage = totalCount / ROW_PER_PAGE;
		if(totalCount % ROW_PER_PAGE != 0) {
			totalPage += 1;
		}
		if(lastPage > totalPage) {
			lastPage = totalPage;
		}
		// 리턴값
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("photoList", photoList);
		returnMap.put("startPage", startPage);
		returnMap.put("lastPage", lastPage);
		returnMap.put("totalPage", totalPage);
		return returnMap;
	}
}
