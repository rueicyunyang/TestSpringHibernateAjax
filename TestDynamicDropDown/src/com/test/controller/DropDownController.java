package com.test.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.test.bean.Continent;
import com.test.bean.Country;
import com.test.service.DropDownService;

@Controller
public class DropDownController {
	
	@Autowired
	DropDownService dropDownService;

	@RequestMapping(value="/queryContinent.do", method = RequestMethod.GET)
	public ModelAndView queryContinent(HttpServletRequest request,HttpServletResponse response){

		List<Continent> list = dropDownService.queryContinent();
		List<Country> countryList = dropDownService.queryCountry("1");

		request.setAttribute("continent", list);
		request.setAttribute("country", countryList);
		
		return new ModelAndView("index1");
	}

	@RequestMapping(value="/queryCountry.do", method = RequestMethod.GET)
	@ResponseBody
	public String queryCountry(HttpServletRequest request,HttpServletResponse response){

		String continentId= request.getParameter("continentId");
		
		List<Continent> list = dropDownService.queryCountry(continentId);
//		回傳給ajax的資料不可用request
//		request.setAttribute("country", list);

		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		
		Gson gson = new Gson();
		String result = gson.toJson(resultMap);
		
		return result;
	}

	public DropDownService getDropDownService() {
		return dropDownService;
	}

	public void setDropDownService(DropDownService dropDownService) {
		this.dropDownService = dropDownService;
	}
}
