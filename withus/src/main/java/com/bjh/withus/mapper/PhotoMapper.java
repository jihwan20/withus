package com.bjh.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.Photo;

@Mapper
public interface PhotoMapper {
	List<Photo> selectPhotoList(Map<String, Object> map);
	
	int selectPhotoTotalCount();
}
