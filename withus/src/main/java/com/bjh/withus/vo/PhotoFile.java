package com.bjh.withus.vo;

import lombok.Data;

@Data
public class PhotoFile {
	private int photoFileNo;
	private int photoNo;
	private String photoFileName;
	private String photoFileType;
	private long photoFileSize;
}
