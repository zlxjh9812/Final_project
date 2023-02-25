package com.spring.biz.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;





public class getMovie_genres {
	private final static String KEY = "f12f9b3cd2d170afcba68ce88803cbbb";
	private String result = "";
	private List<String> list = new ArrayList<String>();
	public List<String> get_genres(String type , int movieID) {
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = "0001-01-01";
		try {
			URL url = new URL("https://api.themoviedb.org/3/"+type+"/"+movieID+"?api_key="+KEY+"&language=ko");
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			// 읽어온 Buffer 데이터를 readLine() 메소드를 사용해서 한줄씩 읽어 result변수에 저장
			result = bf.readLine();
			System.out.println(result.getClass().getName());
			/*
			 * 현재까지는 result에 저장되어 있는 값은 String타입이므로 json타입으로 인식하도록 바꾸기 위해서 JSON 관련 라이브러리를 사용
			 * JSONParser를 사용해서 String 값을 json 객체로 만들어준다.
			 */
			JSONParser jsonParser = new JSONParser();

			// 만들어진 JSON 객체는 JSONObject 사용해서 저장
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			
			JSONArray genre_list = (JSONArray)jsonObject.get("genres");
			
				 list = new ArrayList<String>();
				if(genre_list.size() > 0) {
					for(int i=0; i<genre_list.size(); i++) {
						JSONObject jsonObj = (JSONObject) genre_list.get(i);
						
						System.out.println((String)jsonObj.get("name"));
						list.add((String)jsonObj.get("name"));
					}
					
				}
				
			
			return list;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	}

