package com.bjh.withus.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bjh.withus.service.PhotoService;
import com.bjh.withus.vo.Photo;

@Controller
public class PhotoController {
	@Autowired
	PhotoService photoService;
	
	private final int ROW_PER_PAGE = 6;
	
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
	@PostMapping("/addphoto")
	public String addPhoto(HttpServletRequest request, HttpSession session, Photo photo) {
		String Path = request.getSession().getServletContext().getRealPath("/");
		photoService.getaddPhoto(Path, photo);
		return "redirect:/photoList";
	}
}
