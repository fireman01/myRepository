package com.diet.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.util.CacheUtil;
import com.common.util.FormDataCollectUtil;
import com.common.util.SpringContextUtil;
import com.dictionary.service.DictionaryService;
import com.diet.service.DietService;
import com.user.service.UserService;


@Controller
@RequestMapping("/diet")
public class DietController {
	
	@Autowired(required=true)
	private DietService dietService;
	
	private Logger log = Logger.getLogger(DietController.class);
	
	@RequestMapping("/diet_edit")
	public  String toDietForm(HttpServletRequest request, Model model) throws IOException{
		String pId = (String)request.getSession().getAttribute("pId");
		model.addAttribute("energy",dietService.getTargetEnergy(pId));
		model.addAttribute("typeList",dietService.getTypeList(pId));
		model.addAttribute("mainfoodList",CacheUtil.getInstance().getMainFoodList());
		model.addAttribute("meatList",CacheUtil.getInstance().getMeatList());
		model.addAttribute("vegetablesList",CacheUtil.getInstance().getVegetablesList());
		model.addAttribute("drinkList",CacheUtil.getInstance().getDrinkList());
		model.addAttribute("nutList",CacheUtil.getInstance().getNutList());
		model.addAttribute("fruitsList",CacheUtil.getInstance().getFruitsList());
		return "diet/diet_edit";
	}
	
	@RequestMapping("/mainfood")
	@ResponseBody 
	public List<Map<String, Object>> getMainfood(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getMainFoodList();
		 return list;
	}
	
	@RequestMapping("/meat")
	@ResponseBody 
	public List<Map<String, Object>> getMeat(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getMeatList();
		 return list;
	}
	
	@RequestMapping("/vegetables")
	@ResponseBody 
	public List<Map<String, Object>> getVegetables(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getVegetablesList();
		 return list;
	}
	
	@RequestMapping("/drink")
	@ResponseBody 
	public List<Map<String, Object>> getDrink(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getDrinkList();
		 return list;
	}
	
	@RequestMapping("/nut")
	@ResponseBody 
	public List<Map<String, Object>> getNut(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getNutList();
		 return list;
	}
	
	@RequestMapping("/fruits")
	@ResponseBody 
	public List<Map<String, Object>> getFruits(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getFruitsList();
		 return list;
	}
	
	@RequestMapping("food_add")
	public String doctorAdd(HttpServletRequest request){
		return "diet/food_add";
	}
	
	@RequestMapping("/saveDiet")
	public  void addUser(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		String pId = request.getSession().getAttribute("pId").toString();
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		map.put("pId", pId);
		try {
			String result = dietService.saveDiet(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
	}
	
	@RequestMapping("/food_list")
	public String getFoodListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = dietService.getFoodListWithPage(map);
		model.addAttribute("foodList",list);
		int total = dietService.countFoodTotal();
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/food_list";
	}
	
	@RequestMapping("/diet_list")
	public String getDietListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("dietList",list);
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/diet_list";
	}
	
	@RequestMapping("/sport_list")
	public String getSportListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getSportList(map);
		model.addAttribute("sportList",list);
		int total = dietService.countSportTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/sport_list";
	}
	
	@RequestMapping("/dietary_list")
	public String getDietList(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("dietList",list);
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		return "diet/dietary_list";
	}
	
	@RequestMapping("snack")
	public String toSnack(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> map = dietService.getSnacks(param);
		model.addAttribute("snackInfo", map==null?"":map.get("snacks"));
		return "diet/snack";
	}
	
	@RequestMapping("food_edit")
	public String patientEdit(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("food", dietService.showFoodInfo(param));
		model.addAttribute("curPage",param.get("curPage"));
		return "diet/food_edit";
	}
	
	@RequestMapping("diet_info")
	public String getDietInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		return "diet/diet_info";
	}
	
	@RequestMapping("sport_info")
	public String getSportInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("sportInfo", dietService.getSportInfo(param));
		return "diet/sport_info";
	}
	
	@RequestMapping("dietary_info")
	public String getDietaryInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("bg", dietService.showBloodGlucoseInfo(param));
		model.addAttribute("sportInfo", dietService.getSportInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		model.addAttribute("date", param.get("date"));
		model.addAttribute("pId", param.get("pId"));
		return "diet/dietary_info";
	}
	
	@RequestMapping("bg_edit")
	public String bloodGlucoseEdit(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		model.addAttribute("bg", dietService.getBloodGlucoseInfo(param));
		return "diet/bg_edit";
	}
	
	@RequestMapping("sport_edit")
	public String sportEdit(HttpServletRequest request, Model model){
		DictionaryService dictionaryService = (DictionaryService)SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("sprotTypeList",dictionaryService.getDictionaryListByType("6"));
		Map<String, Object> param = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		param.put("pId", pId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		model.addAttribute("sportInfo",dietService.showSportInfo(param));
		return "diet/sport_edit";
	}
	
	@RequestMapping("saveSport")
	public void saveSportInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			HttpSession session = request.getSession();
			String pId = (String)session.getAttribute("pId");
			param.put("pId", pId);
			String str = dietService.saveSportInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("saveSnacks")
	public void saveSnack(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			HttpSession session = request.getSession();
			String pId = (String)session.getAttribute("pId");
			param.put("pId", pId);
			String str = dietService.saveSnacks(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("bg_list")
	public String bloodGlucoseList(HttpServletRequest request, Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getBloodGlucoseList(map);
		UserService uservice = (UserService)SpringContextUtil.getBeanById("UserService");
		Map<String, Object> userMap = uservice.showUserInfo(map);
		model.addAttribute("bgList",list);
		DictionaryService dictionaryService = (DictionaryService)SpringContextUtil.getBeanById("DictionaryService");
		if("0".equals(userMap.get("diabetesType").toString())){
			model.addAttribute("standard1",dictionaryService.getDictionaryListByType("2").get(0));
			model.addAttribute("standard2",dictionaryService.getDictionaryListByType("3").get(0));
		}else{
			model.addAttribute("standard1",dictionaryService.getDictionaryListByType("4").get(0));
			model.addAttribute("standard2",dictionaryService.getDictionaryListByType("5").get(0));
		}
		int total = dietService.countBloodGlucoseTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		return "diet/bg_list";
	}
	
	@RequestMapping("saveFoodInfo")
	public void saveFoodInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("saveBloodGlucose")
	public void saveBloodGlucoseInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveBloodGlucoseInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("deleteFoodInfo")
	public void deleteDoctorInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.deleteFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("saveAdvice")
	public void saveAdvice(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveAdvice(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
}


