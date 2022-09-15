package com.bjh.withus.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bjh.withus.service.PhotoService;

@Controller
public class PhotoController {
	@Autowired
	PhotoService photoService;
	
	private final int ROW_PER_PAGE = 20;
	
	@GetMapping("/photoList")
	public String getPhotoList(Model model, @RequestParam(defaultValue = "1") int currentPage){
		Map<String, Object> map = photoService.getPhotoList(currentPage, ROW_PER_PAGE);
		model.addAttribute("photoList",map.get("photoList"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("totalPage",map.get("totalPage"));
		model.addAttribute("currentPage",currentPage);
		
		return "photoList";
		
	}
}
