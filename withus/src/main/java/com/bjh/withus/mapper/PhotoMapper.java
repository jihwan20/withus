package com.bjh.withus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bjh.withus.vo.Photo;
import com.bjh.withus.vo.PhotoFile;

@Mapper
public interface PhotoMapper {
	// 앨범 전체 목록
	List<Photo> selectPhotoList(Map<String, Object> map);
	
	// 앨범 전체 갯수(페이징)
	int selectPhotoTotalCount();
	
	// 앨범 추가
	void insertPhoto(Photo photo);
	
	// 앨범 이미지 업로드
	void insertPhotoFile(PhotoFile photoFile);
	
	// 앨범 상세보기
	List<Photo> selectPhotoOne(int photoNo);
}
