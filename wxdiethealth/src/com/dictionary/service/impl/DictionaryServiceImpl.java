package com.dictionary.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.util.CommonUtil;
import com.dictionary.mapper.DictionaryMapper;
import com.dictionary.service.DictionaryService;

@Service("DictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired(required=true)
	private DictionaryMapper DictionaryDao;
	
	public List<Map<String, Object>> getDictionaryList(){
		return DictionaryDao.getDictionaryList();
	}
	
	public List<Map<String, Object>> getDictionaryListByType(String type){
		return DictionaryDao.getDictionaryListByType(type);
	}
	
	public Map<String, Object> getDictionaryListById(Map<String, Object> param){
		return DictionaryDao.getDictionaryListById(param);
	}
	
	public void deleteDictionaryById(String id){
		DictionaryDao.deleteDictionaryById(id);
	}
	
	public String saveDcit(Map<String, Object> param){
		if(param.containsKey("id")){
			DictionaryDao.updateDictionary(param);
		}else{
			param.put("id", CommonUtil.getUUID());
			DictionaryDao.addDictionary(param);
		}
		return "1";
	}
}
