package market.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import common.domain.CarInfoVO;
import project.persistence.CarDAOMyBatis;

public class MarketListMakerAction extends AbstractAction {
	
	CarDAOMyBatis carDao= new CarDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Map<String,Object> mapperParamemter = new HashMap<String,Object>();
		//String align=req.;
		//String nosayong=req.;
		System.out.println
		("//----------------------------------------------------------------------------------------");
		//----------------------------------------------------------------------------------------
		String car_Brand=req.getParameter("car_Brand");
		Integer b_code = bCodeProcess(car_Brand, mapperParamemter);
		//----------------------------------------------------------------------------------------
		String car_Model=req.getParameter("car_Model");
		Integer m_code = mCodeProcess(car_Model, mapperParamemter);
		//----------------------------------------------------------------------------------------
		String car_Detail=req.getParameter("car_Detail");
		Integer s_code = sCodeProcess(car_Detail, mapperParamemter);
		//----------------------------------------------------------------------------------------
		String car_distance_min_str=req.getParameter("car_distance_min");
		Integer car_distance_min = 
				(car_distance_min_str == null || car_distance_min_str.trim().isEmpty())? 
						0 :Integer.parseInt(car_distance_min_str);
		//----------------------------------------------------------------------------------------
		String car_distance_max_str=req.getParameter("car_distance_max");
		Integer car_distance_max = 
				(car_distance_max_str == null || car_distance_max_str.trim().isEmpty())? 
						999999 :Integer.parseInt(car_distance_max_str);
		//----------------------------------------------------------------------------------------
		if(car_distance_min > car_distance_max) {
			car_distance_min = car_distance_max;
			car_distance_max = 999999;
		}
		mapperParamemter.put("car_distance_min", car_distance_min); 
		mapperParamemter.put("car_distance_max", car_distance_max);
		System.out.println("car_distance_min:"+ car_distance_min);
		System.out.println("car_distance_max:"+ car_distance_max);
		//----------------------------------------------------------------------------------------
		String car_Color_array[]=req.getParameterValues("car_Color");
		List<String> car_Color = (car_Color_array == null)? null : Arrays.asList(car_Color_array);
		System.out.println("car_Color:"+car_Color);
		mapperParamemter.put("car_color", car_Color);
		//----------------------------------------------------------------------------------------
		String car_Fuel_array[]=req.getParameterValues("car_Fuel");
		List<String> car_Fuel = (car_Fuel_array == null)? null : Arrays.asList(car_Fuel_array);
		System.out.println("car_Fuel:"+car_Fuel);
		mapperParamemter.put("car_fuel", car_Fuel);
		//----------------------------------------------------------------------------------------
		String car_Gear_array[]=req.getParameterValues("car_Gear");
		List<String> car_Gear = (car_Gear_array == null)? null : Arrays.asList(car_Gear_array);
		System.out.println("car_Fuel:"+car_Gear);
		mapperParamemter.put("car_gear", car_Gear);
		//----------------------------------------------------------------------------------------
		String opt_idx_array[] = req.getParameterValues("opt_idx");
		List<Integer> validList = new ArrayList<Integer>();
		List<String> opt_idx = (opt_idx_array == null)? null : Arrays.asList(opt_idx_array);//list???
		List<Integer> idx_arr = null;// idx_arr null??? ?????????
		if(opt_idx != null) {// opt ?????? ?????? ?????? ?????????
			idx_arr = carDao.findCarsByOpts(opt_idx);//??????-??? ?????? ??????????????? ?????? ?????? 
			if(idx_arr.size() == 0) {//?????? ???????????? ??? ???????????? ???????????? ?????????
				idx_arr.add(0);//??? ???????????? ???????????? 0??? ???????????? ?????? ???????????? ??????
			}
			
			if(idx_arr.get(0) != 0) {
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("idx", null);
				map.put("opt_idx", null);
				for (int i = 0; i < idx_arr.size(); i++) {
					boolean isAppended = true;
					for (int j = 0; j < opt_idx.size(); j++) {
						map.replace("idx", idx_arr.get(i));
						map.replace("opt_idx", opt_idx.get(j));
						//????????? ?????? 0 or 1??? ???????????? 0
						int a = carDao.findRel(map);
						
						if(a == 0/*????????? 0??? ??????????????? ????????? ??????*/) {
							isAppended = false;
						}
					}
					if(isAppended) {
						validList.add(idx_arr.get(i));
					}
				}
				map.clear();
			}
		}
		
		if(opt_idx_array == null) {
			validList = null;
		} else if (idx_arr.get(0) == 0 || validList.size() == 0) {
			validList.add(0);
		}	
		
		System.out.println("opt_idx:"+opt_idx);
		System.out.println("idxs that are searched:"+idx_arr);
		System.out.println("validList:"+validList);		
		mapperParamemter.put("idx_by_opt", validList);
		//----------------------------------------------------------------------------------------
		String car_test = req.getParameter("car_test");
		System.out.println("car_test:"+car_test);
		//mapperParamemter.put("s_code", s_code);
		//----------------------------------------------------------------------------------------
		String car_Seat_array[] = req.getParameterValues("car_Seat");
		List<String> car_Seat = (car_Seat_array == null)? null : Arrays.asList(car_Seat_array);
		System.out.println("car_Seat:"+car_Seat);
		mapperParamemter.put("car_seat", car_Seat);
		//----------------------------------------------------------------------------------------
		System.out.println
		("//----------------------------------------------------------------------------------------");
		//?????????
		String cp = req.getParameter("cpage");
		if(cp==null ||cp.trim().isEmpty()) {
			cp = "1";
		}
		int cpage = Integer.parseInt(cp);
		
		List<CarInfoVO> carList= carDao.carSearchByOption(mapperParamemter);
		//??????????????? start?????? end ?????? ????????? ????????? where?????? ??????????????? ?????? ????????? ???????????? ??????.
		System.out.println("carList:"+carList);
		System.out.println("carList.size():"+carList.size());
		if(carList != null && carList.size()!=0){
			int totalCount = carList.size();
			req.setAttribute("totalCount", totalCount);
			int sise_min = carList.get(0).getCar_price();//????????? 
			int sise_max = carList.get(totalCount-1).getCar_price();//????????? 
			System.out.println("sise_min:"+sise_min);
			System.out.println("sise_max:"+sise_max);
			req.setAttribute("sise_min", sise_min);
			req.setAttribute("sise_max", sise_max);
			carList.clear();
			int pageSize = 8;//??? ???????????? 8??? ????????? ?????????
		
			int pageCount=(totalCount-1)/pageSize +1;
			req.setAttribute("pageCount", pageCount);
			//DB?????? ???????????? ?????? ??????(start, end) ??? ?????????
			Integer end = cpage * pageSize;
			Integer start = end - (pageSize-1);
			//2. ???????????? ????????????
			mapperParamemter.put("start", start);
			mapperParamemter.put("end", end);
			carList= carDao.carSearchByOption(mapperParamemter);//?????? ??????????????? start??? end????????? ???????????? ?????????
			int pagingBlock=5;//???????????? 5??? ????????? ?????? ??????
			Integer prevBlock=0, nextBlock=0;
			prevBlock= (cpage-1)/pagingBlock * pagingBlock;
			nextBlock= prevBlock + (pagingBlock+1);
			
			System.out.println("cpage:"+cpage);
			System.out.println("totalCount:"+totalCount);
			System.out.println("pageCount:"+pageCount);
			System.out.println("start:"+start);
			System.out.println("end:"+end);
			System.out.println("prevBlock:"+prevBlock);
			System.out.println("nextBlock:"+nextBlock);
			
			//----------------------------------------------------------------------------------------
			req.setAttribute("prevBlock", prevBlock);
			req.setAttribute("nextBlock", nextBlock);
			req.setAttribute("carList", carList);
		} else {
			req.setAttribute("totalCount", 0);
		}
		//----------------------------------------------------------------------------------------
		this.setRedirect(false);
		this.setViewPage("market/marketList.jsp");
	}

	private Integer bCodeProcess(String car_Brand, Map<String, Object> mapperParamemter) {
		Integer b_code = null;
		if(car_Brand == null || car_Brand.trim().isEmpty()) {
			b_code = null;
		} else {
				switch (car_Brand) {
				
					case "??????": b_code=10; break;
					case "????????????": b_code=11; break;
					case "??????": b_code=12; break;
					case "?????????(GM??????)": b_code=13; break;
					case "????????????": b_code=14; break;
					case "??????": b_code=15; break;
					
					case "??????": b_code=20; break;
					case "BMW": b_code=21; break;
					case "?????????": b_code=22; break;
					case "?????????": b_code=23; break;
					case "??????": b_code=24; break;
					case "??????": b_code=25; break;
				}
		}
		mapperParamemter.put("b_code", b_code);
		System.out.println("car_Brand:"+car_Brand);
		System.out.println("?????? b_code: "+b_code);
		return b_code;
	}
	
	private Integer mCodeProcess(String car_Model, Map<String, Object> mapperParamemter) {
		Integer m_code;
		if(car_Model == null || car_Model.trim().isEmpty()) {
			m_code = null;
		} else {
			m_code = carDao.dmodelSearchList(car_Model).get(0).getM_code();
		}
		mapperParamemter.put("m_code", m_code);
		System.out.println("car_Model:"+car_Model);
		System.out.println("?????? m_code: "+m_code);
		return m_code;
	}

	private Integer sCodeProcess(String car_Detail, Map<String, Object> mapperParamemter) {
		Integer s_code;
		if(car_Detail == null || car_Detail.trim().isEmpty()) {
			s_code = null;
		} else {
			s_code = carDao.searchByDemodel(car_Detail).getS_code();
		}
		mapperParamemter.put("s_code", s_code);
		System.out.println("car_Detail:"+car_Detail);
		System.out.println("?????? s_code: "+s_code);
		return s_code;
	}
}
