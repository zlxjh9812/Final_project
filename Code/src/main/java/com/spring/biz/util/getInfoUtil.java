package com.spring.biz.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.spring.biz.movie.ContentsVO;

public class getInfoUtil {
	private final String KEY = "f12f9b3cd2d170afcba68ce88803cbbb";
	private String result = "";
	public getInfoUtil() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPages(String type) {
		int page = 0;

		try {
			// 데이터를 받아오기 위한 API 호출 URL, type (영화인지 시리즈인지에 따라 결과 값이 달라짐)
			URL url = new URL("https://api.themoviedb.org/3/discover/" + type + "?api_key=" + KEY
					+ "&with_watch_providers=8&watch_region=KR&language=ko");

			// URL 객체를 통해서 url을 연결한 후 API가 제공하는 원본데이터를 가져와서 버퍼에 저장
			BufferedReader bf;

			/*
			 * BufferedReader는 속성에 Reader 클래스가 와야하는데, URL에서 제공되는 메소드인 openStream() 사용하기 위해
			 * InputStreamReader를 속성으로 사용. 한글이 깨지는 경우가 있어서 UTF-8을 추가.
			 */
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			// 읽어온 Buffer 데이터를 readLine() 메소드를 사용해서 한줄씩 읽어 result변수에 저장
			result = bf.readLine();

			/*
			 * 현재까지는 result에 저장되어 있는 값은 String타입이므로 json타입으로 인식하도록 바꾸기 위해서 JSON 관련 라이브러리를 사용
			 * JSONParser를 사용해서 String 값을 json 객체로 만들어준다.
			 */
			JSONParser jsonParser = new JSONParser();

			// 만들어진 JSON 객체는 JSONObject 사용해서 저장
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);

			// 만들어진 JSONObject에서 key가 total_pages인 value를 추출하기 위해서 get() 사용
			String pages = jsonObject.get("total_pages").toString();
			System.out.println(pages);
			page = Integer.parseInt(pages);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}
	
	public List<ContentsVO> getInfoList(String type) {
		int pages = getPages(type);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = "0001-01-01";

		List<ContentsVO> infoList = null;
		List<Integer> genreList = null;
        
		try {

			infoList = new ArrayList<ContentsVO>();

			// 페이지 마다 루프를 돌며 값 추출 및 저장
			for (int i = 1; i <= 1; i++) {
				String apiURL = "https://api.themoviedb.org/3/discover/" + type + "?api_key=" + KEY
						+ "&with_watch_providers=8&watch_region=KR&language=ko&page=" + i;
				URL url = new URL(apiURL);

				BufferedReader bf;

				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

				result = bf.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONArray list = (JSONArray) jsonObject.get("results");

				for (int j = 0; j < list.size(); j++) {
					ContentsVO vo = new ContentsVO();
					JSONObject contents = (JSONObject) list.get(j);

					vo.setContents_num(Integer.parseInt(String.valueOf(contents.get("id"))));
					vo.setContents_type(type);
					vo.setOverview(contents.get("overview").toString());
					vo.setVote_average(Float.parseFloat(String.valueOf(contents.get("vote_average"))));
					vo.setPopularity(Float.parseFloat(String.valueOf(contents.get("popularity"))));
                    
					// 컨텐츠 타입(영화/시리즈)에 따라서 파싱 방법 다르게 설정
					if (type.equals("movie")) {
                    
						// 시리즈일 경우 release_date를 key로 데이터 파싱
						if (contents.get("release_date") == null || contents.get("release_date").equals("")) {
							vo.setRelease_date(dateFormat.parse(date));
						} else {
							Date release_date = dateFormat.parse((String) contents.get("release_date"));
							vo.setRelease_date(release_date);
						}
						vo.setTitle(contents.get("title").toString());
					} else if (type.equals("tv")) {
                    
						// 시리즈일 경우 first_air_date를 key로 데이터 파싱
						if (contents.get("first_air_date") == null || contents.get("first_air_date").equals("")) {
							vo.setRelease_date(dateFormat.parse(date));
						} else {
							Date first_air_date = dateFormat.parse((String) contents.get("first_air_date"));
							vo.setRelease_date(first_air_date);
						}
                        
						// 시리즈일 경우 title이 아닌 name을 key로 데이터 파싱
						vo.setTitle(contents.get("name").toString());
					}
					if (contents.get("poster_path") == null || contents.get("poster_path").toString().equals("")) {
						vo.setPoster_path("");
					} else {
						vo.setPoster_path(contents.get("poster_path").toString());
					}

					// 장르 id를 List<integer> 형태로 저장 → 장르 비교를 위한 작업
					JSONArray genre_list = (JSONArray) contents.get("genre_ids");
                    genreList = new ArrayList<Integer>();
					for (int k = 0; k < genre_list.size(); k++) {
						genreList.add(Integer.parseInt(String.valueOf(genre_list.get(k))));
					}
					vo.setGenres(genreList);
					infoList.add(vo);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoList;
		
	}
	
}
