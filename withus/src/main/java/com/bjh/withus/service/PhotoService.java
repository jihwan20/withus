package com.bjh.withus.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bjh.withus.mapper.PhotoMapper;
import com.bjh.withus.vo.Photo;
import com.bjh.withus.vo.PhotoFile;

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
		
		System.out.println("[BJH] = " + photoList);
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
	// 앨범 작성
	public void getaddPhoto(String path, Photo photo) {
		photoMapper.insertPhoto(photo);
		int photoNo = photo.getPhotoNo();
		
		// 이미지 추가
		List<PhotoFile> photoFile = null;
		if(photo.getPhotoFileUpload() != null) { 
			photoFile = new ArrayList<PhotoFile>();
			for(MultipartFile mf : photo.getPhotoFileUpload()) {
				PhotoFile pf = new PhotoFile();
				pf.setPhotoNo(photoNo);
				String originName = mf.getOriginalFilename();
				int p = originName.lastIndexOf(".");
				String imageName = UUID.randomUUID().toString();
				String imageType = originName.substring(p+1);
				// if문을 이용해 파일추가 안할시 DB에 NULL값이 저장되는 걸 방지
				if(imageType.equals("")) {
					break;
				}
				pf.setPhotoFileName(imageName);
				pf.setPhotoFileType(imageType);
				pf.setPhotoFileSize(mf.getSize());
				photoFile.add(pf);
				try {
					mf.transferTo(new File(path+"images\\"+imageName+"."+imageType));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(photoFile != null) {
			for(PhotoFile pf : photoFile) {
				photoMapper.insertPhotoFile(pf);
			}
		}
		
	}
	// 앨범 상세보기
	public List<Photo> getPhotoOne(int photoNo) {
		List<Photo> photo = photoMapper.selectPhotoOne(photoNo);
		System.out.println("[BJH] : " + photo);
		return photo;
	}
	
	// 앨범 수정
	public void updatePhoto(Photo photo, PhotoFile photoFile, String path) {
		photoMapper.updatePhoto(photo);
		int photoNo = photo.getPhotoNo();
		// 이미지 수정
		List<PhotoFile> pfList = null;
		if(photo.getPhotoFileUpload() != null) {
			pfList = new ArrayList<PhotoFile>();
			for(MultipartFile mf : photo.getPhotoFileUpload()) {
				photoFile.setPhotoNo(photoNo);
				String originName = mf.getOriginalFilename();
				int p = originName.lastIndexOf(".");
				String imageName = UUID.randomUUID().toString();
				String imageType = originName.substring(p+1);
				// if문을 이용해 파일추가 안할시 DB에 NULL값이 저장되는 걸 방지
				if(imageType.equals("")) {
					break;
				}
				photoFile.setPhotoFileName(imageName);
				photoFile.setPhotoFileType(imageType);
				photoFile.setPhotoFileSize(mf.getSize());
				pfList.add(photoFile);
				try {
					mf.transferTo(new File(path+"images\\"+imageName+"."+imageType));
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(pfList != null) {
			for(PhotoFile pf : pfList) {
				photoMapper.updatePhotoFile(pf);
			}
		}
	}
	// 앨범 삭제
	public void deletePhoto(Photo photo, PhotoFile photofile) {
		if(photofile != null && photo != null) {
			photoMapper.deletePhotoFile(photofile);
		}
		if(photofile == null && photo != null) {
			photoMapper.deletePhoto(photo);
		}
	}
}
