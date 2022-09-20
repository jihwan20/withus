package com.bjh.withus.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Photo {
	private int photoNo;
	private String photoName;
	private String createDate;
	private String updateDate;
	private List<MultipartFile> photoFileUpload;
	private List<PhotoFile> pfList;
	private PhotoFile photoFile;
}
