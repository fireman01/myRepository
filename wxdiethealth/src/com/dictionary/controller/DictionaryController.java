package com.dictionary.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.dictionary.service.DictionaryService;


@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	
	@Autowired(required=true)
	private DictionaryService dictionaryService;
	
	private Logger log = Logger.getLogger(DictionaryController.class);
	
	@RequestMapping("/dictionary_list")
	public String getDictList(HttpServletRequest requset, Model model){
		List<Map<String, Object>> list = dictionaryService.getDictionaryList();
		model.addAttribute("dictList",list);
		return "dictionary/dictionary_list";
	}
	
	@RequestMapping("dictionary_edit")
	public String dictionaryEdit(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dict", dictionaryService.getDictionaryListById(param));
		return "dictionary/dictionary_edit";
	}
	
	@RequestMapping("dictionary_add")
	public String dictionaryAdd(){
		return "dictionary/dictionary_add";
	}
	
	@RequestMapping("saveDict")
	public void saveDict(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dictionaryService.saveDcit(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("deleteDict")
	public void deleteDict(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		try {
			dictionaryService.deleteDictionaryById(id);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("1");
		} catch (Exception e) {
			log.error(e);
		}
	}
}


